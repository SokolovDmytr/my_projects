import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/image_with_id.dart';

class HomePageState {
  final List<Ingredient> ingredients;
  final List<Ingredient> tempIngredients;
  final List<Ingredient> allIngredient;
  final List<ImageWithId> images;

  const HomePageState({
    required this.ingredients,
    required this.tempIngredients,
    required this.allIngredient,
    required this.images,
  });

  HomePageState copyWith({
    List<Ingredient>? inputIngredients,
    List<Ingredient>? inputTempIngredients,
    List<Ingredient>? inputAllIngredient,
    List<ImageWithId>? inputListImageWithId,
  }) {
    return HomePageState(
      ingredients: inputIngredients ?? ingredients,
      tempIngredients: inputTempIngredients ?? tempIngredients,
      allIngredient: inputAllIngredient ?? allIngredient,
      images: inputListImageWithId ?? images,
    );
  }
}
