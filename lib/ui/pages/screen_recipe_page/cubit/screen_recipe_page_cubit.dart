import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/cubit/screen_recipe_page_state.dart';

class ScreenRecipePageCubit extends Cubit<ScreenRecipePageState> {
  ScreenRecipePageCubit({
    required bool isFavorite,
  }) : super(ScreenRecipePageState(
          isFavourite: isFavorite,
        ));

  void updateFavouriteStatus({required bool isFavourite}) {
    emit(state.copyWith(isFavourite: isFavourite));
  }
}
