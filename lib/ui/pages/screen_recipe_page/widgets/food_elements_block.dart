import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/custom_network_image.dart';
import 'package:provider/src/provider.dart';

class FoodElementsBlock extends StatefulWidget {
  final Recipe recipe;

  const FoodElementsBlock({
    required this.recipe,
    Key? key,
  }) : super(key: key);

  @override
  _FoodElementsBlockState createState() => _FoodElementsBlockState();
}

class _FoodElementsBlockState extends State<FoodElementsBlock> {
  List<Ingredient> availableIngredients = [];
  List<Ingredient> missingIngredients = [];
  List<Widget> missingWidgets = [];
  List<Widget> availableWidgets = [];
  final ScreenRecipeLanguage _language = FlutterDictionary.instance.language?.screenRecipeLanguage ?? en.screenRecipeLanguage;

  @override
  Widget build(BuildContext context) {
    missingWidgets.clear();
    availableWidgets.clear();
    availableIngredients.clear();
    missingIngredients.clear();
    _createMissingAvailableLists();
    _createAvailableWidgetsList();
    _createMissingWidgetsList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            _language.foodElements,
            style: AppFonts.mediumTextStyleBlack,
          ),
        ),
        missingIngredients.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: missingWidgets,
                ),
              ),
        availableIngredients.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: availableWidgets,
                ),
              ),
      ],
    );
  }

  void _createMissingAvailableLists() {
    final List<Ingredient> tempList = [];
    if (context.read<IngredientsBloc>().state.ingredients.isEmpty) {
      for (int indexRecipe = 0; indexRecipe < widget.recipe.ingredients.length; indexRecipe++) {
        missingIngredients.add(widget.recipe.ingredients[indexRecipe]);
      }
      return;
    }
    for (int indexRecipe = 0; indexRecipe < widget.recipe.ingredients.length; indexRecipe++) {
      tempList.clear();
      for (int indexStored = 0; indexStored < context.read<IngredientsBloc>().state.ingredients.length; indexStored++) {
        if (widget.recipe.ingredients[indexRecipe].name == context.read<IngredientsBloc>().state.ingredients[indexStored].name) {
          tempList.add(widget.recipe.ingredients[indexRecipe]);
          availableIngredients.addAll(tempList);
        }
      }
      if (tempList.isEmpty) {
        missingIngredients.add(widget.recipe.ingredients[indexRecipe]);
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    key: ValueKey(missingIngredients[index].i),
                    height: 32.0,
                    width: 32.0,
                    child: CustomNetworkImage(
                      url: missingIngredients[index].image,
                      placeholder: Image.asset(ImageAssets.chefYellow),
                      fit: BoxFit.contain,
                      errorFit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      missingIngredients[index].name ?? emptyString,
                      style: AppFonts.medium16Height24PastelRedTextStyle,
                    ),
                  ),
                ],
              ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    key: ValueKey(availableIngredients[index].i),
                    width: 32.0,
                    height: 32.0,
                    child: CustomNetworkImage(
                      url: availableIngredients[index].image,
                      placeholder: Image.asset(ImageAssets.chefYellow),
                      fit: BoxFit.contain,
                      errorFit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      availableIngredients[index].name ?? emptyString,
                      style: AppFonts.medium16Height26TextStyle,
                    ),
                  ),
                ],
              ),
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
