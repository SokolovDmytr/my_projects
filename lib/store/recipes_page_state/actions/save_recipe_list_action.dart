import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class SaveRecipeListAction extends BaseAction {
  final List<Recipe> recipes;

  const SaveRecipeListAction({
    @required this.recipes,
  }) : super(
          type: 'SaveRecipeListAction',
        );
}
