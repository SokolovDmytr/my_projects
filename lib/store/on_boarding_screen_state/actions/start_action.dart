import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class StartAction {
  final Store<AppState> store;

  StartAction({
    @required this.store,
  });
}
