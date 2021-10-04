import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class RemoveFromFavoriteAction extends BaseAction {
  final Recipe recipe;

  const RemoveFromFavoriteAction({
    @required this.recipe,
  }) : super(
          type: 'RemoveFromFavoriteAction',
        );
}
