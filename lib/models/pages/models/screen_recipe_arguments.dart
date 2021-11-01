import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';

class ScreenRecipeArguments {
  final List<Recipe> recipes;
  final int index;
  final List<Ingredient> ingredients;

  const ScreenRecipeArguments({
    required this.recipes,
    required this.index,
    required this.ingredients,
  });
}
