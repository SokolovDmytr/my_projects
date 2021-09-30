import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class DeleteFavoriteRecipeAction extends BaseAction {
  final int i;

  const DeleteFavoriteRecipeAction({
    @required this.i,
  }) : super(type: 'DeleteFavoriteRecipeAction');
}
