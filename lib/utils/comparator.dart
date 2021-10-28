import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';

class CustomComparator {
  static List<Ingredient> getMissingIngredients({
    required Recipe recipe,
    required List<Ingredient> ingredients,
  }) {
    final List<Ingredient> missingIngredient = [];

    final List<Ingredient> recipeIngredients = recipe.ingredients;

    for (Ingredient recipeIngredient in recipeIngredients) {
      bool isFind = false;
      for (Ingredient ingredient in ingredients) {
        if (recipeIngredient.id == ingredient.id) {
          isFind = true;
          break;
        }
      }

      if (isFind == false) {
        missingIngredient.add(recipeIngredient);
      }
    }

    return missingIngredient;
  }
}
