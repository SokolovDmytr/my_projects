import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';

class FoodElementsBlock extends StatefulWidget {
  final List<Ingredient> ingredientsStored;
  final Recipe recipe;

  const FoodElementsBlock({
    @required this.ingredientsStored,
    @required this.recipe,
    Key key,
  }) : super(key: key);

  @override
  _FoodElementsBlockState createState() => _FoodElementsBlockState();
}

class _FoodElementsBlockState extends State<FoodElementsBlock> {
  List<Ingredient> availableIngredients = [];
  List<Ingredient> missingIngredients = [];
  List<Widget> missingWidgets = [];
  List<Widget> availableWidgets = [];
  final ScreenRecipeLanguage _language =
      FlutterDictionary.instance.language?.screenRecipeLanguage ??
          en.screenRecipeLanguage;

  @override
  Widget build(BuildContext context) {
    _createMissingAvailableLists();
    _createAvailableWidgetsList();
    _createMissingWidgetsList();
    return Column(
      children: [
        Text(
          _language.foodElements,
          style: AppFonts.mediumTextStyleBlack,
        ),
        missingIngredients.isEmpty
            ? SizedBox()
            : Column(
                children: missingWidgets,
              ),
        availableIngredients.isEmpty
            ? SizedBox()
            : Column(
                children: availableWidgets,
              ),
      ],
    );
  }

  void _createMissingAvailableLists() {
    final List<Ingredient> tempList = [];
    if (widget.ingredientsStored.isEmpty) {
      missingIngredients = widget.recipe.ingredients;
      return;
    }
    for (int indexRecipe = 0;
        indexRecipe < widget.recipe.ingredients.length;
        indexRecipe++) {
      for (int indexStored = 0;
          indexStored < widget.ingredientsStored.length;
          indexStored++) {
        if (widget.recipe.ingredients[indexRecipe].name ==
            widget.ingredientsStored[indexStored].name) {
          tempList.add(widget.recipe.ingredients[indexRecipe]);
        }
        if (indexStored == widget.ingredientsStored.length - 1 &&
            tempList.isEmpty) {
          missingIngredients.add(widget.recipe.ingredients[indexRecipe]);
        } else {
          availableIngredients.addAll(tempList);
          tempList.clear();
        }
      }
    }
  }

  void _createMissingWidgetsList() {
    if (missingIngredients.isEmpty) {
      return;
    }
    missingWidgets.add(
      Text(
        _language.youDontHave,
        style: AppFonts.medium16Height24PastelRedTextStyle,
      ),
    );
    for (int index = 0; index < missingIngredients.length; index++) {
      missingWidgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  missingIngredients[index].image,
                  height: 32.0,
                  width: 32.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    missingIngredients[index].name,
                    style: AppFonts.medium16Height24PastelRedTextStyle,
                  ),
                ),
              ],
            ),
            Text(
              '${missingIngredients[index].count} ${missingIngredients[index].description}',
              style: AppFonts.smallPaselRedTextStyle,
            ),
          ],
        ),
      );
    }
  }

  void _createAvailableWidgetsList() {
    if (availableIngredients.isEmpty) {
      return;
    }
    availableWidgets.add(
      Text(
        _language.youHave,
        style: AppFonts.medium16blackTwoTextStyle,
      ),
    );
    for (int index = 0; index < availableIngredients.length; index++) {
      availableWidgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  availableIngredients[index].image,
                  height: 32.0,
                  width: 32.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    availableIngredients[index].name,
                    style: AppFonts.medium16Height26TextStyle,
                  ),
                ),
              ],
            ),
            Text(
              '${availableIngredients[index].count} ${availableIngredients[index].description}',
              style: AppFonts.smallTextStyle,
            ),
          ],
        ),
      );
    }
  }
}
