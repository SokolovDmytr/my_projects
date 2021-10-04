import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class GetRecipesWithIngredientsAction extends BaseAction {
  final List<String> ids;
  GetRecipesWithIngredientsAction({
    @required this.ids,
  }) : super(
          type: 'GetRecipesWithIngredientsAction',
        );
}
