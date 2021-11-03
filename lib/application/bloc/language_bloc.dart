import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_event.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_events.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_event.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/repositories/ingredient_repository.dart';
import 'package:fridge_yellow_team_bloc/repositories/recipe_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class LanguageBloc extends Bloc<ChangeLanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(currentLocale: FlutterDictionaryDelegate.getCurrentLocale)) {
    on<ChangeLanguageEvent>(
      (event, emit) async {
        FlutterDictionary.instance.setNewLanguage(event.newLanguage);
        final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

        DialogService.instance.show(
          dialog: LoaderPopUp(
            title: language.loadingText,
            state: true,
            loaderKey: LoaderKey.getData,
            child: LoaderWidget(),
          ),
        );

        final bool isConnection = await NetworkService.instance.checkInternetConnection();

        if (isConnection == false) {
          DialogService.instance.close();

          DialogService.instance.show(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        }

        final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();

        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse responseWithIngredient = await IngredientRepository.instance.fetchAllIngredientData(token: token);

        final BaseHttpResponse responseFavoriteRecipe = await RecipeRepository.instance.fetchFavoriteRecipeData(token: token);

        if (responseWithIngredient.error == null && responseFavoriteRecipe.error == null) {
          final List ingredients = FridgeParser.instance.parseList(
            exampleObject: Ingredient,
            response: responseWithIngredient,
          );

          RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().add(
                UpdateAllIngredientsEvent(
                  ingredients: ingredients as List<Ingredient>,
                ),
              );

          final recipes = FridgeParser.instance.parseList(
            exampleObject: Recipe,
            response: responseFavoriteRecipe,
          );

          final List<Recipe> resRecipes = [];
          for (Recipe recipe in recipes) {
            final List<Ingredient> resIngredients = [];
            for (Ingredient ingredient in recipe.ingredients) {
              for (Ingredient dataIngredient in ingredients) {
                if (ingredient.i == dataIngredient.i) {
                  resIngredients.add(
                    ingredient.copyWith(
                      name: dataIngredient.name,
                      image: dataIngredient.image,
                    ),
                  );
                }
              }
            }

            resRecipes.add(
              recipe.copyWith(
                isFavorite: true,
                ingredients: resIngredients,
              ),
            );
          }

          RouteService.instance.navigatorKey.currentState!.context.read<RecipesBloc>().add(
                UpdateRecipesEvent(favouriteRecipes: resRecipes),
              );

          final List<Ingredient> oldLocaleIngredients =
              RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().state.ingredients;
          final List<Ingredient> newLocaleIngredients = [];
          for (Ingredient oldLocaleIngredient in oldLocaleIngredients) {
            for (Ingredient newLocaleIngredient in ingredients) {
              if (oldLocaleIngredient.id == newLocaleIngredient.id) {
                newLocaleIngredients.add(newLocaleIngredient);
                break;
              }
            }
          }

          RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().add(
                UpdateIngredientsEvent(
                  ingredients: newLocaleIngredients,
                ),
              );

          emit(state.copyWith(currentLocale: event.newLanguage));

          DialogService.instance.close();
        } else {
          DialogService.instance.close();

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );
  }
}