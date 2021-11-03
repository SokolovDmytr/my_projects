import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';

class IngredientsEvent {
  const IngredientsEvent();
}

class LoadAllIngredientsEvent extends IngredientsEvent {}

class AddIngredientEvent extends IngredientsEvent {
  final Ingredient ingredient;

  const AddIngredientEvent({
    required this.ingredient,
  });
}

class ClearIngredientsEvent extends IngredientsEvent {}

class DeleteIngredientEvent extends IngredientsEvent {
  final String ingredientId;

  const DeleteIngredientEvent({
    required this.ingredientId,
  });
}

class UpdateIngredientsEvent extends IngredientsEvent {
  final List<Ingredient> ingredients;

  const UpdateIngredientsEvent({
    required this.ingredients,
  });
}

class UpdateAllIngredientsEvent extends IngredientsEvent {
  final List<Ingredient> ingredients;

  const UpdateAllIngredientsEvent({
    required this.ingredients,
  });
}
