import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';

class CustomComparator {
  static List<Ingredient> getMissingsIngredients({
    @required Recipe recipe,
    @required List<Ingredient> ingredients,
  }) {
    final List<Ingredient> missingIngredient = [];

    final List<Ingredient> recipeIngredients = recipe.ingredients;

    for(Ingredient recipeIngredient in recipeIngredients){
      bool isFind = false;
      for(Ingredient ingredient in ingredients){
        if(recipeIngredient.id == ingredient.id){
          isFind = true;
          break;
        }
      }

      if(isFind == false)
        missingIngredient.add(recipeIngredient);
    }

    return missingIngredient;
  }
}
