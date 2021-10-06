import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class GetRecipesAction extends BaseAction{
  final List<Recipe> recipes;
  final Recipe recipe;

 const GetRecipesAction({
    @required this.recipes,
    @required this.recipe,
  });
}
