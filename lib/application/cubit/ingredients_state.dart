import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';

class IngredientState {
  final List<Ingredient> allIngredients;

  const IngredientState({required this.allIngredients});

  IngredientState copyWith({
    List<Ingredient>? inputAllIngredients,
  }) {
    return IngredientState(
      allIngredients: inputAllIngredients ?? allIngredients,
    );
  }
}
