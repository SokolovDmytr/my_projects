import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';

class SaveFavoriteRecipeAction {
  final List<Recipe> recipes;

  SaveFavoriteRecipeAction({
    @required this.recipes,
  });
}
