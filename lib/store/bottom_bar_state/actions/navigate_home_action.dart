import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class NavigateHomeAction {
  final Store<AppState> store;

  const NavigateHomeAction({
    @required this.store,
  });
}
