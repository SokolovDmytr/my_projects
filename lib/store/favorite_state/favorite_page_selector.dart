import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/get_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/open_card_action.dart';

class FavoritePageSelector {
  static void getData({
    @required Store<AppState> store,
  }) {
    store.dispatch(
      GetFavoriteRecipeAction(),
    );
  }

  static void openCard({
    @required Store<AppState> store,
    @required String id,
  }) {
    store.dispatch(
      OpenCardAction(id: id),
    );
  }
}
