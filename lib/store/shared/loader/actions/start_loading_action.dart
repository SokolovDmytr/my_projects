import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class StartLoadingAction extends BaseAction {
  final ILoader loader;

  const StartLoadingAction({
    @required this.loader,
  }) : super(type: 'StartLoadingAction');
}
