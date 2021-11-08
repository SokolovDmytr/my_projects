import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingridients_bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingridients_bloc/ingredients_event.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_events.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_event.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/exception/no_internet_connection_exception.dart';
import 'package:fridge_yellow_team_bloc/models/exception/server_error_exception.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class LanguageBloc extends Bloc<ChangeLanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(currentLocale: FlutterDictionaryDelegate.getCurrentLocale)) {
    on<ChangeLanguageEvent>(
      (event, emit) async {
        final String locCode = FlutterDictionaryDelegate.getCurrentLocale;

        FlutterDictionary.instance.setNewLanguage(event.newLanguage);
        final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

        DialogService.instance.show(
          dialog: LoaderPopUp(
            title: language.loadingText,
            state: true,
            loaderKey: LoaderKey.getData,
            child: LoaderWidget(),
          ),
        );
        try {
          final bool isConnection = await NetworkService.instance.checkInternetConnection();

          if (isConnection == false) {
            throw NoInternetConnectionException();
          }

          final Completer completerForIngredient = Completer();
          final Completer completerForRecipe = Completer();

          final List<Ingredient> oldLocaleAllIngredients =
              RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().state.allIngredients;

          RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().add(
                QuietlyFetchAllIngredientsEvent(completer: completerForIngredient),
              );

          final bool loadNewIngredients = await completerForIngredient.future;
          if (loadNewIngredients) {
            RouteService.instance.navigatorKey.currentState!.context.read<RecipesBloc>().add(
                  QuientlyFetchFavoritesRecipeEvent(completer: completerForRecipe),
                );

            final bool loadNewFavoriteRecipes = await completerForRecipe.future;
            if (loadNewFavoriteRecipes) {
              emit(
                state.copyWith(currentLocale: event.newLanguage),
              );
              DialogService.instance.close();
              return;
            } else {
              RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().add(
                    RollbackToPrevIngredientsStateEvent(allIngredients: oldLocaleAllIngredients),
                  );
            }
          }
          throw ServerError();
        } on NoInternetConnectionException {
          DialogService.instance.close();

          DialogService.instance.show(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        } on ServerError {
          FlutterDictionary.instance.setNewLanguage(locCode);
          DialogService.instance.close();

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );
  }
}
