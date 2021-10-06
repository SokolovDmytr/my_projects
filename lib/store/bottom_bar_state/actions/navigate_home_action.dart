import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class NavigateHomeAction extends BaseAction{
  final Store<AppState> store;

  const NavigateHomeAction({
    @required this.store,
  });
}
