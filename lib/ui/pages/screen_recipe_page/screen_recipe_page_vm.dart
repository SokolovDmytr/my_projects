import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class ScreenRecipePageViewModel {
  final Recipe recipe;
  final List<Recipe> recipes;
  final List<Ingredient> ingredient;
  final void Function() onTapBack;

  const ScreenRecipePageViewModel({
    @required this.recipe,
    @required this.recipes,
    @required this.ingredient,
    @required this.onTapBack,
  });

  static ScreenRecipePageViewModel init(Store<AppState> store) {
    return ScreenRecipePageViewModel(
      recipe: store.state.screenRecipePageState.recipe,
      recipes: store.state.screenRecipePageState.recipes,
      ingredient: store.state.homePageState.ingredients,
      onTapBack: () => RouteSelectors.pop(store: store),
    );
  }
}
