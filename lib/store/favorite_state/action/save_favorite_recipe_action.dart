import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class SaveFavoriteRecipeAction extends BaseAction {
  final List<Recipe> recipes;

  const SaveFavoriteRecipeAction({
    @required this.recipes,
  }) : super(type: 'SaveFavoriteRecipeAction');
}
