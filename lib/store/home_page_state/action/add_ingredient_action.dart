import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class AddIngredientAction extends BaseAction {
  final Ingredient ingredient;

  const AddIngredientAction({
    @required this.ingredient,
  }) : super(type: 'AddIngredientAction');
}
