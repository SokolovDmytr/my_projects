import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';

class RecipesState {
  final List<Recipe> favoriteRecipes;
  final List<Recipe> recipes;

  const RecipesState({
    required this.recipes,
    required this.favoriteRecipes,
  });

  RecipesState copyWith({
    List<Recipe>? inputRecipe,
    List<Recipe>? inputFavoriteRecipes,
  }) =>
      RecipesState(
        recipes: inputRecipe ?? recipes,
        favoriteRecipes: inputFavoriteRecipes ?? favoriteRecipes,
      );
}
