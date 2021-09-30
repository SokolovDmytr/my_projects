import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_ingredients_with_string_action.dart';

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
}
