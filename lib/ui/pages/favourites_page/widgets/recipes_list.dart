import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipe_element.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipes_list_view_model.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/screen_recipe_page.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RecipesListViewModel>(
      converter: RecipesListViewModel.init,
      onInitialBuild: (RecipesListViewModel vm) => vm.getFavoriteRecipeList(),
      builder: (BuildContext ctx, RecipesListViewModel viewModel) {
        return ListView.builder(
          itemCount: viewModel.recipes.length,
          itemBuilder: (BuildContext _, int index) {
            return InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenRecipePage(
                        recipe: viewModel.recipes[index],
                      ))),
              child: RecipeElement(
                recipe: viewModel.recipes[index],
                isOpen: viewModel.recipes[index].i.toString() ==
                    viewModel.openCardId,
                openCard: viewModel.openCard,
              ),
            );
          },
        );
      },
    );
  }
}
