import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class NavigateSettingsAction {
  final Store<AppState> store;

  NavigateSettingsAction({
    @required this.store,
  });
}
