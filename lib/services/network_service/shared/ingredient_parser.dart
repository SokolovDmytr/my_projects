import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';

class IngredientParser {
  List<Ingredient> parseDataForRecipeList({
    @required List<dynamic> data,
  }) {
    final List<Ingredient> ingredients = [];

    if (data != null) {
      for (var item in data) {
        ingredients.add(
          Ingredient(i: item['i'], description: item['count'], count: item['description']),
        );
      }
    }

    return ingredients;
  }

  List<Ingredient> parse({
    @required List<dynamic> data,
  }) {
    final List<Ingredient> ingredients = [];

    for (var item in data) {
      ingredients.add(
        Ingredient(
          id: item['i'],
          name: item['name'],
          image: item['image'],
        ),
      );
    }

    return ingredients;
  }
}
