import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/favorite_page_selector.dart';
import 'package:yellow_team_fridge/store/screen_recipe_page/screen_recipe_page_selectors.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class RecipesListViewModel {
  final List<Recipe> recipes;
  final String openCardId;
  final void Function() getFavoriteRecipeList;
  final void Function(String) openCard;
  final void Function() goToScreenRecipePage;
  final void Function(Recipe recipe) saveRecipe;
  final void Function(List<Recipe> recipes, Recipe recipe) saveRecipes;

  const RecipesListViewModel({
    @required this.recipes,
    @required this.openCardId,
    @required this.getFavoriteRecipeList,
    @required this.openCard,
    @required this.goToScreenRecipePage,
    @required this.saveRecipe,
    @required this.saveRecipes,
  });

  static RecipesListViewModel init(
    Store<AppState> store,
  ) {
    return RecipesListViewModel(
      recipes: store.state.favoriteState.recipes,
      openCardId: store.state.favoriteState.openCardId,
      getFavoriteRecipeList: () => FavoritePageSelector.getData(store: store),
      openCard: (String id) => FavoritePageSelector.openCard(store: store, id: id),
      goToScreenRecipePage: () => RouteSelectors.pushNamed(store: store, route: AppRoutes.screenRecipePage),
      saveRecipe: (Recipe recipe) => ScreenPageRecipeSelector.saveRecipe(store, recipe),
      saveRecipes: (List<Recipe> recipes, Recipe recipe) => ScreenPageRecipeSelector.saveRecipes(store, recipes, recipe),
    );
  }
}
