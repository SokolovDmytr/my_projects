import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_event.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_state.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/repositories/ingredient_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/cache_manager/image_cache_manager.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class IngredientsBloc extends Bloc<IngredientsEvent, IngredientsState> {
  IngredientsBloc()
      : super(
          const IngredientsState(
            allIngredients: [],
            ingredients: [],
          ),
        ) {
    on<LoadAllIngredientsEvent>(
      (event, emit) async {
        if (state.allIngredients.isNotEmpty) {
          return;
        }

        final bool isConnection = await NetworkService.instance.checkInternetConnection();

        if (isConnection == false) {
          DialogService.instance.show(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        }

        final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();

        if (token == emptyString) {
          return;
        }

        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await IngredientRepository.instance.fetchAllIngredientData(
          token: token,
        );

        if (response.error == null) {
          final List<Ingredient> ingredients = FridgeParser.instance.parseList(
            exampleObject: Ingredient,
            response: response,
          ) as List<Ingredient>;

          emit(
            state.copyWith(inputAllIngredients: ingredients),
          );

          unawaited(
            ImageCacheManager.instance.loadImages(ingredients: ingredients),
          );
        } else {
          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );

    on<AddIngredientEvent>(
      (event, emit) {
        final List<Ingredient> resIngredients = List.from(state.ingredients);
        resIngredients.add(event.ingredient);

        emit(
          state.copyWith(
            inputIngredients: resIngredients,
          ),
        );
      },
    );

    on<ClearIngredientsEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            inputIngredients: [],
          ),
        );
      },
    );

    on<DeleteIngredientEvent>(
      (event, emit) {
        final List<Ingredient> resIngredients = List.from(state.ingredients);
        resIngredients.removeWhere((element) => element.i == event.ingredientId);
        emit(
          state.copyWith(inputIngredients: resIngredients),
        );
      },
    );

    on<UpdateIngredientsEvent>(
      (event, emit) {
        emit(
          state.copyWith(inputIngredients: event.ingredients),
        );
      },
    );

    on<UpdateAllIngredientsEvent>(
      (event, emit) {
        emit(
          state.copyWith(inputAllIngredients: event.ingredients),
        );
      },
    );
  }
}
