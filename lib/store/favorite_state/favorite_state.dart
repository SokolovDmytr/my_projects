import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/open_card_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/save_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class FavoriteState {
  final List<Recipe> recipes;
  final String openCardId;

  const FavoriteState({
    @required this.recipes,
    @required this.openCardId,
  });

  factory FavoriteState.initial() {
    return FavoriteState(
      recipes: [],
      openCardId: null,
    );
  }

  FavoriteState copyWith({
    List<Recipe> inputRecipes,
    String id,
  }) {
    return FavoriteState(
      recipes: inputRecipes ?? recipes,
      openCardId: id ?? openCardId,
    );
  }

  FavoriteState reducer(dynamic action) {
    return Reducer<FavoriteState>(
      actions: HashMap.from({
        SaveFavoriteRecipeAction: (dynamic action) => _saveRecipeList(action: action),
        OpenCardAction: (dynamic action) => _openCard(action: action),
      }),
    ).updateState(action, this);
  }

  FavoriteState _saveRecipeList({
    @required SaveFavoriteRecipeAction action,
  }) {
    return copyWith(inputRecipes: action.recipes);
  }

  FavoriteState _openCard({
    @required OpenCardAction action,
  }) {
    return copyWith(id: action.id);
  }
}
