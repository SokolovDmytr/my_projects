import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/models/exception/no_internet_connection_exception.dart';
import 'package:fridge_yellow_team_bloc/models/exception/server_error_exception.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/repositories/repositories_interface/i_ingredient_repository.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/text_field_loader/text_field_loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/bloc/home_page_event.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  IIngredientRepository repository;

  HomePageBloc({
    required TextFieldLoaderWidget loader,
    required this.repository,
  }) : super(HomePageState(tempIngredients: [], loader: loader)) {
    on<LoadIngredientsWithNameEvent>(
      (event, emit) async {
        state.loader.rebuild!(true);
        try {
          final bool isConnection = await NetworkService.instance.checkInternetConnection();

          if (isConnection == false) {
            throw NoInternetConnectionException();
          }

          final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();

          final BaseHttpResponse response = await repository.fetchIngredientData(
            token: token,
            ingredientName: event.str,
          );

          if (response.response == null) {
            throw ServerErrorException();
          } else {
            final List<Ingredient> ingredients = FridgeParser.instance.parseList(
              exampleObject: Ingredient,
              response: response,
            ) as List<Ingredient>;

            emit(
              state.copyWith(inputTempIngredients: ingredients),
            );

            state.loader.rebuild!(false);
          }
        } on NoInternetConnectionException {
          DialogService.instance.show(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          state.loader.rebuild!(false);
          return;
        }on ServerErrorException{
          state.loader.rebuild!(false);
          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );

    on<ClearTempIngredientsEvent>(
      (event, emit) => emit(
        state.copyWith(
          inputTempIngredients: [],
        ),
      ),
    );

    on<UpdateListIngredientsWithNewLanguage>((event, emit) {
      final List<Ingredient> allIngredients = RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().state.allIngredients;
      final List<Ingredient> resIngredients = [];

      for (Ingredient ingredient in state.tempIngredients) {
        for (Ingredient ingredientWithNewLocale in allIngredients) {
          if (ingredient.i == ingredientWithNewLocale.i) {
            resIngredients.add(ingredientWithNewLocale);
          }
        }
      }

      emit(
        state.copyWith(inputTempIngredients: resIngredients),
      );
    });
  }
}
