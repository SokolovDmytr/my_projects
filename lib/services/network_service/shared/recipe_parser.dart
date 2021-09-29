import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
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

        recipes.add(
          Recipe(
            i: item['i'],
            name: item['name'],
            calories: item['image'],
            time: item['time'],
            level: item['level'],
            image: item['image'],
            ingredients: ingredients,
          ),
        );
      }
    } catch (error) {
      print('Recipe parser error: ${error}');
    }

    return recipes;
  }
}
