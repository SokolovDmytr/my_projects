import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/res/const.dart';

class IngredientParser {
  List<Ingredient> parseDataForRecipeList({
    @required List<dynamic> data,
  }) {
    final List<Ingredient> ingredients = [];

    if (data != null) {
      try {
        for (var item in data) {
          ingredients.add(
            Ingredient(
              i: item['i'],
              id: int.parse(item['i']),
              description: item['count'],
              count: item['description'],
            ),
          );
        }
      } catch (error) {
        logger.d('parseDataForRecipeList error: ${error}');
      }
    }

    return ingredients;
  }

  List<Ingredient> parse({
    @required List<dynamic> data,
  }) {
    final List<Ingredient> ingredients = [];

    try {
      for (var item in data) {
        ingredients.add(
          Ingredient(
            id: item['i'],
            i: item['i'].toString(),
            name: item['name'],
            image: item['image'],
          ),
        );
      }
    } catch (error) {
      logger.d('Ingredient parse error: ${error}');
    }

    return ingredients;
  }
}
