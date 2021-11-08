import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';

class IngredientsState {
  final List<Ingredient> allIngredients;
  final List<Ingredient> ingredients;

  const IngredientsState({
    required this.allIngredients,
    required this.ingredients,
  });

  IngredientsState copyWith({
    List<Ingredient>? inputAllIngredients,
    List<Ingredient>? inputIngredients,
  }) {
    return IngredientsState(
      allIngredients: inputAllIngredients ?? allIngredients,
      ingredients: inputIngredients ?? ingredients,
    );
  }
}
