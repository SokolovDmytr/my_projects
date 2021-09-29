import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/save_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class FavoriteState {
  List<Recipe> recipes;

  FavoriteState({
    @required this.recipes,
  });

  factory FavoriteState.initial() {
    return FavoriteState(recipes: []);
  }

  FavoriteState copyWith(List<Recipe> inputRecipes) {
    return FavoriteState(
      recipes: inputRecipes ?? recipes,
    );
  }

  FavoriteState reducer(dynamic action) {
    return Reducer<FavoriteState>(
      actions: HashMap.from({
        SaveFavoriteRecipeAction: (dynamic action) =>
            _saveRecipeList(action: action),
      }),
    ).updateState(action, this);
  }

  FavoriteState _saveRecipeList({
    @required SaveFavoriteRecipeAction action,
  }) {
    return FavoriteState(recipes: action.recipes);
  }
}
