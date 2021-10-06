import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/actions/save_recipe_list_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class RecipesPageState {
  final List<Recipe> recipes;

  const RecipesPageState({
    @required this.recipes,
  });

  factory RecipesPageState.initial() {
    return RecipesPageState(
      recipes: [],
    );
  }

RecipesPageState copyWith({
  List<Recipe> inputRecipes,
  }) {
    return RecipesPageState(
      recipes: inputRecipes ?? recipes,
    );
  }

RecipesPageState reducer(dynamic action) {
    return Reducer<RecipesPageState>(
      actions: HashMap.from({
        SaveRecipeListAction: (dynamic action) =>  _saveRecipeList(action),
      }),
    ).updateState(action, this);
  }

  RecipesPageState _saveRecipeList(SaveRecipeListAction action){
    return copyWith(
      inputRecipes: action.recipes,
    );
  }
}
