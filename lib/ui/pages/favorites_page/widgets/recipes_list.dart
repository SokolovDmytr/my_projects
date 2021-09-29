import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/pages/favorites_page/widgets/recipe_element.dart';
import 'package:yellow_team_fridge/ui/pages/favorites_page/widgets/recipes_list_view_model.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RecipesListViewModel>(
      converter: RecipesListViewModel.init,
      onInitialBuild: (RecipesListViewModel vm) => vm.getFavoriteRecipeList(),
      builder: (BuildContext ctx, RecipesListViewModel viewModel) {
        print('rebuild');
        return ListView.builder(
          itemCount: viewModel.recipes.length,
          itemBuilder: (BuildContext _, int index) {
            return RecipeElement(
              recipe: viewModel.recipes[index],
              isOpen: viewModel.recipes[index].i.toString() == viewModel.openCardId,
              openCard: viewModel.openCard,
            );
          },
        );
      },
    );
  }
}
