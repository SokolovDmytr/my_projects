import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class RecipesState {
  final List<Recipe> recipes;

  RecipesState({
    @required this.recipes,
  });

  factory RecipesState.initial() {
    return RecipesState(recipes: []);
  }

  RecipesState copyWith(List<Recipe> inputRecipes) {
    return RecipesState(
      recipes: inputRecipes ?? recipes,
    );
  }

  RecipesState reducer(dynamic action) {
    return Reducer<RecipesState>(
      actions: HashMap.from({

      }),
    ).updateState(action, this);
  }
}
