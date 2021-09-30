import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/get_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/open_card_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/favorite_page_selector.dart';

class RecipesListViewModel {
  final List<Recipe> recipes;
  final String openCardId;
  final void Function() getFavoriteRecipeList;
  final void Function(String) openCard;

  RecipesListViewModel({
    @required this.recipes,
    @required this.openCardId,
    @required this.getFavoriteRecipeList,
    @required this.openCard,
  });

  static RecipesListViewModel init(
    Store<AppState> store,
  ) {
    return RecipesListViewModel(
      recipes: store.state.favoriteState.recipes,
      openCardId: store.state.favoriteState.openCardId,
      getFavoriteRecipeList: () => FavoritePageSelector.getData(store: store),
      openCard: (String id) => FavoritePageSelector.openCard(store: store, id: id),
    );
  }
}
