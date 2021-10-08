import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/network_service/shared/ingredient_parser.dart';

class RecipeParser {
  List<Recipe> parse({
    @required List<dynamic> data,
  }) {
    final List<Recipe> recipes = [];
    final IngredientParser ingredientParser = IngredientParser();

    try {
      for (var item in data) {
        final List<Ingredient> ingredients = ingredientParser.parseDataForRecipeList(
          data: item['ingredients'],
        );

        final List<String> steps = [];
        final List<dynamic> stepsData = item['steps'];
        for(var stepData in stepsData){
          steps.add(stepData);
        }

        recipes.add(
          Recipe(
            i: item['i'],
            name: item['name'],
            calories: item['calories'],
            time: item['time'],
            level: item['level'],
            image: item['image'],
            ingredients: ingredients,
            steps: steps,
          ),
        );
      }
    } catch (error) {
      logger.d('Recipe parser error: ${error}');
    }

    return recipes;
  }
}
