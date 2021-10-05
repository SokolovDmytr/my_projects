import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';

class GetRecipesAction {
  final List<Recipe> recipes;
  final Recipe recipe;

  GetRecipesAction({
    @required this.recipes,
    @required this.recipe,
  });
}
