import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class GetIngredientsWithStringAction extends BaseAction {
  final String name;

  const GetIngredientsWithStringAction({
    @required this.name,
  }) : super(type: 'GetIngredientsWithStringAction');
}
