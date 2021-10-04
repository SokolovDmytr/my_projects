import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class ScreenRecipePageState {
  final Recipe recipe;

  const ScreenRecipePageState({
    @required this.recipe,
  });

  factory ScreenRecipePageState.initial() {
    return ScreenRecipePageState(
      recipe: null,
    );
  }

  ScreenRecipePageState copyWith({
    Recipe inputRecipe,
  }) {
    return ScreenRecipePageState(
      recipe: inputRecipe ?? recipe,
    );
  }

  ScreenRecipePageState reducer(dynamic action) {
    return Reducer<ScreenRecipePageState>(
      actions: HashMap.from({}),
    ).updateState(action, this);
  }
}
