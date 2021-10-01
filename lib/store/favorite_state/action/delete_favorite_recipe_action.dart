import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class DeleteFavoriteRecipeAction extends BaseAction {
  final int id;

  const DeleteFavoriteRecipeAction({
    @required this.id,
  }) : super(type: 'DeleteFavoriteRecipeAction');
}
