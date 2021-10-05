import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    _createMissingAvailableLists();
    return Column(
      children: [
        Text(
          'Food elements:',
          style: AppFonts.mediumTextStyleBlack,
        ),
        missingIngredients.isEmpty
            ? SizedBox()
            : Column(
                children: [],
              ),
        availableIngredients.isEmpty
            ? SizedBox()
            : Column(
                children: [],
              ),
      ],
    );
  }
}
