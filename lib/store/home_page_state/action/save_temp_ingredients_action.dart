import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class SaveTempIngredientsAction extends BaseAction {
  final List<Ingredient> ingredients;

  const SaveTempIngredientsAction({
    @required this.ingredients,
  }) : super(type: 'SaveTempIngredientsAction');
}
