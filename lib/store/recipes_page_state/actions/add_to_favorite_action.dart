import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class AddToFavoriteAction extends BaseAction {
  final Recipe recipe;

  const AddToFavoriteAction({
    @required this.recipe,
  }) : super(
          type: 'AddToFavoriteAction',
        );
}
