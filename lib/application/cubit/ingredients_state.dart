import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';

class IngredientState {
  final List<Ingredient> allIngredients;
  final List<Ingredient> ingredients;

  const IngredientState({
    required this.allIngredients,
    required this.ingredients,
  });

  IngredientState copyWith({
    List<Ingredient>? inputAllIngredients,
    List<Ingredient>? inputIngredients,
  }) {
    return IngredientState(
      allIngredients: inputAllIngredients ?? allIngredients,
      ingredients: inputIngredients ?? ingredients,
    );
  }
}
