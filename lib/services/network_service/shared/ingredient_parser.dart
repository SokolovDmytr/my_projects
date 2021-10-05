import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';

class IngredientParser {
  List<Ingredient> parseDataForRecipeList({
    @required List<dynamic> data,
  }) {
    final List<Ingredient> ingredients = [];

    if (data != null) {
      try {
        for (var item in data) {
          ingredients.add(
            Ingredient(i: item['i'], id: int.parse(item['i']), description: item['count'], count: item['description']),
          );
        }
      } catch (error) {
        print(error);
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
      print(error);
    }

    return ingredients;
  }
}
