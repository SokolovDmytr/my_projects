import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class UpdateListRoutes extends BaseAction {
  final List<String> routes;

  const UpdateListRoutes({
    @required this.routes,
  });
}
