import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/actions/get_recipes_with_ingredients_action.dart';

class RecipesPageSelector {
  static void fetchData({
    @required Store<AppState> store,
    @required List<String> ids,
  }) {
    store.dispatch(
      GetRecipesWithIngredientsAction(
        ids: ids,
      ),
    );
  }
}
