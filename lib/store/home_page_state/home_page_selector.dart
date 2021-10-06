import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/add_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/clear_ingredient_list_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/clear_temp_ingredient_list_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/delete_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_all_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_ingredients_with_string_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_action.dart';

class HomePageSelector {
  static void getIngredientsWithName({
    @required Store<AppState> store,
    @required String name,
  }) {
    return store.dispatch(
      GetIngredientsWithStringAction(
        name: name,
      ),
    );
  }

  static void addIngredient({
    @required Store<AppState> store,
    @required Ingredient ingredient,
  }) {
    return store.dispatch(
      AddIngredientAction(
        ingredient: ingredient,
      ),
    );
  }

  static void clearTempIngredientList({
    @required Store<AppState> store,
  }) {
    return store.dispatch(
      ClearTempIngredientListAction(),
    );
  }

  static void deleteIngredient({
    @required Store<AppState> store,
    @required String id,
  }) {
    return store.dispatch(
      DeleteIngredientAction(id: id),
    );
  }

  static void clearIngredientList({
    @required Store<AppState> store,
  }) {
    return store.dispatch(
      ClearIngredientListAction(),
    );
  }

  static void toRecipesPage({
    @required Store<AppState> store,
  }) {
    store.dispatch(
      NavigatePushNamedAction(
        route: AppRoutes.recipes,
      ),
    );
  }

  static void getAllIngredient({
    @required Store<AppState> store,
  }) {
    if(store.state.homePageState.allIngredient.isEmpty){
      store.dispatch(
        GetAllIngredientAction(),
      );
    }

  }
}
