import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/recipes_page_selector.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class RecipesPageViewModel {
  final List<Recipe> recipes;
  final Function() fetchData;
  final void Function() onTapBack;

  const RecipesPageViewModel({
    @required this.recipes,
    @required this.fetchData,
    @required this.onTapBack,
  });

  static RecipesPageViewModel init(
    Store<AppState> store,
  ) {
    return RecipesPageViewModel(
      recipes: store.state.recipesPageState.recipes,
      onTapBack: () => RouteSelectors.pop(store: store),
      fetchData: () {
        final List<Ingredient> ingredients = store.state.homePageState.ingredients;
        final List<String> ids = [];

        for (Ingredient ingredient in ingredients) {
          ids.add(ingredient.i);
        }
        RecipesPageSelector.fetchData(store: store, ids: ids);
      },
    );
  }
}
