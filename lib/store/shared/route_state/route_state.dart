import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/update_list_routes.dart';

class RouteState {
  final List<String> routes;

  const RouteState({
    @required this.routes,
  });

  factory RouteState.initial() {
    return RouteState(
      routes: [AppRoutes.onBoardingScreen],
    );
  }

  RouteState copyWith({
    @required List<String> inputRoute,
  }) {
    return RouteState(
      routes: inputRoute ?? routes,
    );
  }

  RouteState reducer(dynamic action) {
    return Reducer<RouteState>(
      actions: HashMap.from({
        UpdateListRoutes: (dynamic action) => _updateListRoutes(action),
      }),
    ).updateState(action, this);
  }

  RouteState _updateListRoutes(UpdateListRoutes action) {
    return copyWith(inputRoute: action.routes);
  }
}
