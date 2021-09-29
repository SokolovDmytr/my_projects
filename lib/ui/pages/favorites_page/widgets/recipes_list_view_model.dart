import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/get_favorite_recipe_action.dart';

class RecipesListViewModel {
  final List<Recipe> recipes;
  final void Function() getFavoriteRecipeList;

  RecipesListViewModel({
    @required this.recipes,
    @required this.getFavoriteRecipeList,
  });

  static RecipesListViewModel init(
    Store<AppState> store,
  ) {
    return RecipesListViewModel(
      recipes: store.state.favoriteState.recipes,
      getFavoriteRecipeList: () => store.dispatch(
        GetFavoriteRecipeAction(),
      ),
    );
  }
}
