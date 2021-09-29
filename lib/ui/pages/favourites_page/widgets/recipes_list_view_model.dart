import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/get_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/open_card_action.dart';

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
      getFavoriteRecipeList: () => store.dispatch(
        GetFavoriteRecipeAction(),
      ),
      openCard: (String id) => store.dispatch(
        OpenCardAction(id: id),
      ),
    );
  }
}
