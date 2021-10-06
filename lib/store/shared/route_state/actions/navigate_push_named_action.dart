import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class NavigatePushNamedAction extends BaseAction {
  final String route;

  const NavigatePushNamedAction({
    @required this.route,
  });
}
