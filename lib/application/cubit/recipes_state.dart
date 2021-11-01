import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';

class RecipesState {
  final List<Recipe> favoriteRecipes;
  final List<Recipe> recipe;

  RecipesState({
    required this.recipe,
    required this.favoriteRecipes,
  });

  RecipesState copyWith({
    List<Recipe>? inputRecipe,
    List<Recipe>? inputFavoriteRecipes,
  }) =>
      RecipesState(
        recipe: inputRecipe ?? recipe,
        favoriteRecipes: inputFavoriteRecipes ?? favoriteRecipes,
      );
}
