import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/screen_recipe_page/actions/get_recipe_action.dart';
import 'package:yellow_team_fridge/store/screen_recipe_page/actions/get_recipes_action.dart';

class ScreenPageRecipeSelector {
  static void Function(Recipe recipe) saveRecipe(Store<AppState> store, Recipe recipe) {
    return store.dispatch(GetRecipeAction(recipe: recipe));
  }

  static void Function(List<Recipe> recipes, Recipe recipe) saveRecipes(Store<AppState> store, List<Recipe> recipes, Recipe recipe) {
    return store.dispatch(GetRecipesAction(recipes: recipes, recipe: recipe));
  }
}
