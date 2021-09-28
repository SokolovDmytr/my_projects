import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/pages/favorites/widgets/recipes_list_view_model.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RecipesListViewModel>(
      builder: (BuildContext ctx, RecipesListViewModel viewModel) {
        return ListView.builder(
            itemCount: viewModel.recipes.length,
            itemBuilder: (BuildContext _, int index) {
              viewModel.recipes[index];
            });
      },
      converter: RecipesListViewModel.init,
    );
  }
}
