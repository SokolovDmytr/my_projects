import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class RecipesListViewModel {
  final List<Recipe> recipes;

  RecipesListViewModel({@required this.recipes});

  static RecipesListViewModel init(
    Store<AppState> store,
  ) {
    return RecipesListViewModel(recipes: store.state.recipesState.recipes);
  }
}
