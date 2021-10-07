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
                  child: Text(missingIngredients[index].name),
                ),
              ],
            ),
            Text('${missingIngredients[index].count} ${missingIngredients[index].description}'),
          ],
        ),
      );
    }
  }

  void _createAvailableWidgetsList() {}
}