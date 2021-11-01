import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';

class HomePageState {
  final List<Ingredient> tempIngredients;

  const HomePageState({
    required this.tempIngredients,
  });

  HomePageState copyWith({
    List<Ingredient>? inputTempIngredients,
  }) {
    return HomePageState(
      tempIngredients: inputTempIngredients ?? tempIngredients,
    );
  }
}
