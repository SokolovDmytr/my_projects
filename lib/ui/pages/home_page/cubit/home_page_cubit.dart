import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/repositories/ingredient_repository.dart';
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
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/cubit/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit()
      : super(
          const HomePageState(
            ingredients: [],
            tempIngredients: [],
            images: [],
          ),
        );

  Future<void> getIngredientsWithString({required String str}) async {
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

    NetworkService.instance.init(baseUrl: baseUrl);
    final BaseHttpResponse response = await IngredientRepository.instance.fetchIngredientData(
      token: token,
      ingredientName: str,
    );

    if (response.error == null) {
      final List<Ingredient> ingredients = FridgeParser.instance.parseList(
        exampleObject: Ingredient,
        response: response,
      ) as List<Ingredient>;

      emit(
        state.copyWith(inputTempIngredients: ingredients),
      );
    } else {
      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    }
  }

  void addIngredient({required Ingredient ingredient}) {
    final List<Ingredient> resIngredients = List.from(state.ingredients);
    resIngredients.add(ingredient);

    emit(
      state.copyWith(
        inputIngredients: resIngredients,
      ),
    );
  }

  void clearTempIngredients() {
    emit(
      state.copyWith(
        inputTempIngredients: [],
      ),
    );
  }

  void clearIngredients() {
    emit(
      state.copyWith(
        inputIngredients: [],
      ),
    );
  }

  void deleteIngredient({required String id}) {
    final List<Ingredient> resIngredients = List.from(state.ingredients);
    resIngredients.removeWhere((element) => element.i == id);
    emit(
      state.copyWith(inputIngredients: resIngredients),
    );
  }

  bool ingredientsIsEmpty() => state.ingredients.isEmpty;
}
