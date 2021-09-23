import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';
import 'package:yellow_team_fridge/store/shared/loader/loader_state.dart';

class StopLoadingAction extends BaseAction {
  final LoaderKey loaderKey;

  StopLoadingAction({
    @required this.loaderKey,
  }) : super(type: 'StopLoadingAction');
}
