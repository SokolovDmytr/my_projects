import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorite_page/widgets/recipe_element.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouritesPageLanguage language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;
    return true
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90.0),
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
            ),
          )
        : ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext _, int index) {
              return InkWell(
                onTap: () {
                  // viewModel.saveRecipe(viewModel.recipes[index]);
                  // viewModel.saveRecipes(viewModel.recipes, viewModel.recipes[index]);
                  // viewModel.isPreviousFavourite(true);
                  // viewModel.goToScreenRecipePage();
                },
                // child: Padding(
                //   padding: index == 0
                //       ? const EdgeInsets.only(top: 21.0, left: 15.0, right: 15.0, bottom: 16.0)
                //       : const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 16.0),
                //   child: RecipeElement(
                //     key: ValueKey(viewModel.recipes[index].i),
                //     recipe: viewModel.recipes[index],
                //     needOpenFunction: true,
                //     needFavoriteIcon: true,
                //   ),
                // ),
              );
            },
          );
  }
}
