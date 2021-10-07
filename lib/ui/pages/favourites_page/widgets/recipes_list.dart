import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipe_element.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipes_list_view_model.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouritesPageLanguage language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;

    return StoreConnector<AppState, RecipesListViewModel>(
      converter: RecipesListViewModel.init,
      onInitialBuild: (RecipesListViewModel vm) => vm.getFavoriteRecipeList(),
      builder: (BuildContext ctx, RecipesListViewModel viewModel) {
        return viewModel.recipes.isEmpty
            ? Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      70.0,
                      90.0,
                      70.0,
                      90.0,
                    ),
                    child: Text(
                      language.listEmpty,
                      style: AppFonts.normalBlackHeight30TextStyle,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      ImageAssets.favoritePageChef,
                    ),
                  ),
                ],
              )
            : Container(
                margin: const EdgeInsets.only(top: 21.0),
                child: ListView.builder(
                  itemCount: viewModel.recipes.length,
                  itemBuilder: (BuildContext _, int index) {
                    viewModel.recipes[index].isFavorite = true;
                    return InkWell(
                      onTap: () {
                        viewModel.saveRecipe(viewModel.recipes[index]);
                        viewModel.saveRecipes(viewModel.recipes, viewModel.recipes[index]);
                        viewModel.goToScreenRecipePage();
                      },
                      child: RecipeElement(
                        recipe: viewModel.recipes[index],
                        needOpenFunction: true,
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
