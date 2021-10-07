import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class MainLayoutViewModel {
  void Function() basicPop;

  MainLayoutViewModel({
    @required this.basicPop,
  });

  static MainLayoutViewModel init(Store<AppState> store) {
    return MainLayoutViewModel(
      basicPop: () => RouteSelectors.pop(store: store),
    );
  }
}
