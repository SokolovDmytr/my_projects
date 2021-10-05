import 'dart:collection';

import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/screen_recipe_page/actions/get_recipe_action.dart';
import 'package:yellow_team_fridge/store/screen_recipe_page/actions/get_recipes_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class ScreenRecipePageState {
  final Recipe recipe;
  final List<Recipe> recipes;

  const ScreenRecipePageState({
    this.recipe,
    this.recipes,
  });

  factory ScreenRecipePageState.initial() {
    return ScreenRecipePageState();
  }

  ScreenRecipePageState copyWith({
    Recipe recipe,
    List<Recipe> recipes,
  }) {
    return ScreenRecipePageState(
      recipe: recipe ?? this.recipe,
      recipes: recipes ?? this.recipes,
    );
  }

  ScreenRecipePageState reducer(dynamic action) {
    return Reducer<ScreenRecipePageState>(
      actions: HashMap.from({
        GetRecipeAction: (dynamic action) => _saveRecipe(action.recipe),
        GetRecipesAction: (dynamic action) => _saveRecipes(action.recipes, action.recipe),
      }),
    ).updateState(action, this);
  }

  ScreenRecipePageState _saveRecipe(Recipe newRecipe) {
    return copyWith(recipe: newRecipe);
  }

  ScreenRecipePageState _saveRecipes(List<Recipe> newRecipes, Recipe newRecipe) {
    newRecipes.remove(recipe);
    return copyWith(recipes: newRecipes);
  }
}
