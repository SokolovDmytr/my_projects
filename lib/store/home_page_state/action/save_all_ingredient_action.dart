import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class SaveAllIngredientAction extends BaseAction {
  final List<Ingredient> ingredients;

  const SaveAllIngredientAction({
    @required this.ingredients,
  }) : super(
          type: 'SaveAllIngredientAction',
        );
}
