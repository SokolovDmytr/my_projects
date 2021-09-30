import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class DeleteIngredientAction extends BaseAction{
  final String id;

  const DeleteIngredientAction({@required this.id,}) :super(type: 'DeleteIngredientAction');
}