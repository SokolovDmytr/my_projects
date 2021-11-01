import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/screen_recipe_arguments.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorite_page/widgets/recipe_element.dart';

class SimilarRecipesBlock extends StatefulWidget {
  final ScreenRecipeArguments arguments;

  const SimilarRecipesBlock({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  @override
  _SimilarRecipesBlockState createState() => _SimilarRecipesBlockState();
}

class _SimilarRecipesBlockState extends State<SimilarRecipesBlock> {
  final ScreenRecipeLanguage _language = FlutterDictionary.instance.language?.screenRecipeLanguage ?? en.screenRecipeLanguage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: FlutterDictionary.instance.isRTL
              ? const EdgeInsets.only(
                  top: 40.0,
                  right: 20.0,
                )
              : const EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                ),
          child: Text(
            _language.similarRecipes,
            style: AppFonts.normalBlackTextStyle,
          ),
        ),
        SizedBox(
          height: 185.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.arguments.recipes.length,
            itemBuilder: (context, index) =>
            widget.arguments.index == index ? const SizedBox():
            Container(
              height: 125.0,
              width: 350.0,
              margin: FlutterDictionary.instance.isRTL
                  ? const EdgeInsets.only(right: 20.0, bottom: 10.0)
                  : const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: InkWell(
                onTap: () {
                  // if (vm.isPreviousFavourite) {
                  //   vm.saveRecipe(vm.recipes[index]);
                  //   vm.saveRecipes(vm.allFavouritesRecipesList, vm.recipes[index]);
                  // } else {
                  //   vm.saveRecipe(vm.recipes[index]);
                  //   vm.saveRecipes(vm.allRecipesList, vm.recipes[index]);
                  // }
                  RouteSelectors.goToScreenRecipePageReplace(
                    arguments: ScreenRecipeArguments(
                      ingredients: widget.arguments.ingredients,
                      index: index,
                      recipes: widget.arguments.recipes,
                    ),
                  ).call();
                },
                child: Padding(
                  padding: index == widget.arguments.recipes.length - 1
                      ? const EdgeInsets.only(top: 20.0, bottom: 24.0, right: 20.0)
                      : const EdgeInsets.only(top: 20.0, bottom: 24.0),
                  child: RecipeElement(
                    needOpenFunction: false,
                    recipe: widget.arguments.recipes[index],
                    needFavoriteIcon: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
