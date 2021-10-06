import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class NavigatePushNamedAndRemoveUntilAction extends BaseAction {
  final String route;
  final String routeNamePredicate;

  const NavigatePushNamedAndRemoveUntilAction({
    @required this.route,
    @required this.routeNamePredicate,
  });
}
