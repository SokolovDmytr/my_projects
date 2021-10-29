import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/image_with_id.dart';

class HomePageState {
  final List<Ingredient> ingredients;
  final List<Ingredient> tempIngredients;
  final List<ImageWithId> images;

  const HomePageState({
    required this.ingredients,
    required this.tempIngredients,
    required this.images,
  });

  HomePageState copyWith({
    List<Ingredient>? inputIngredients,
    List<Ingredient>? inputTempIngredients,
    List<ImageWithId>? inputListImageWithId,
  }) {
    return HomePageState(
      ingredients: inputIngredients ?? ingredients,
      tempIngredients: inputTempIngredients ?? tempIngredients,
      images: inputListImageWithId ?? images,
    );
  }
}
