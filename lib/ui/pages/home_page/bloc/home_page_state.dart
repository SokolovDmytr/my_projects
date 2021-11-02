import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/text_field_loader/text_field_loader_widget.dart';

class HomePageState {
  final List<Ingredient> tempIngredients;
  final TextFieldLoaderWidget loader;

  const HomePageState({
    required this.tempIngredients,
    required this.loader,
  });

  HomePageState copyWith({
    List<Ingredient>? inputTempIngredients,
    TextFieldLoaderWidget? inputLoader,
  }) {
    return HomePageState(
      tempIngredients: inputTempIngredients ?? tempIngredients,
      loader: inputLoader ?? loader,
    );
  }
}
