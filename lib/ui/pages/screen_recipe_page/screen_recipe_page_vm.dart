import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class ScreenRecipePageViewModel {
  final Recipe recipe;
  final List<Recipe> recipes;
  final List<Ingredient> ingredient;

  ScreenRecipePageViewModel({
    @required this.recipe,
    @required this.recipes,
    @required this.ingredient,
  });

  static ScreenRecipePageViewModel init(Store<AppState> store) {
    return ScreenRecipePageViewModel(
      recipe: store.state.screenRecipePageState.recipe,
      recipes: store.state.screenRecipePageState.recipes,
      ingredient: store.state.homePageState.ingredients,
    );
  }
}
