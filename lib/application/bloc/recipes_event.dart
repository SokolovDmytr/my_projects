import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';

class RecipesEvent {
  const RecipesEvent();
}

class LoadRecipesEvent extends RecipesEvent {
  final List<Ingredient> ingredients;

  const LoadRecipesEvent({
    required this.ingredients,
  });
}

class LoadFavoriteRecipesEvent extends RecipesEvent {}

class AddFavouritesRecipeEvent extends RecipesEvent {
  final Recipe recipe;

  const AddFavouritesRecipeEvent({
    required this.recipe,
  });
}

class RemoveFavouriteRecipeEvent extends RecipesEvent {
  final Recipe recipe;

  const RemoveFavouriteRecipeEvent({
    required this.recipe,
  });
}

class UpdateRecipesEvent extends RecipesEvent {
  final List<Recipe> favouriteRecipes;

  const UpdateRecipesEvent({
    required this.favouriteRecipes,
  });
}
