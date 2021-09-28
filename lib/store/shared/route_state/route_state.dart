import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_pop_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_and_remove_until_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_replace_action.dart';

class RouteState {
  final List<String> routes;

  RouteState({@required this.routes});

  factory RouteState.initial() {
    return RouteState(
      routes: ['/'],
    );
  }

  RouteState copyWith(List<String> inputRoute,) {
    return RouteState(
      routes: inputRoute ?? routes,
    );
  }

  RouteState reducer(dynamic action) {
    return Reducer<RouteState>(
      actions: HashMap.from({
        NavigatePopAction: (dynamic action) => _navigatePop(action),
        NavigatePushNamedAction: (dynamic action) => _navigatePush(action),
        NavigateReplaceAction: (dynamic action) => _navigateReplace(action),
        NavigatePushNamedAndRemoveUntilAction: (dynamic action) => _navigatePushNamedAndRemoveUntil(action),
      }),
    ).updateState(action, this);
  }

  RouteState _navigateReplace(NavigateReplaceAction action) {
    final List<String> result = List<String>.from(routes);
    if (result.isNotEmpty) {
      result.removeLast();
    }
    result.add(action.route);

    return RouteState(routes: result);
  }

  RouteState _navigatePush(NavigatePushNamedAction action) {
    final List<String> result = List<String>.from(routes);
    result.add(action.route);

    return RouteState(routes: result);
  }

  RouteState _navigatePop(NavigatePopAction action) {
    final List<String> result = List<String>.from(routes);
    if (result.isNotEmpty) {
      result.removeLast();
    }

    return RouteState(routes: result);
  }

  RouteState _navigatePushNamedAndRemoveUntil(NavigatePushNamedAndRemoveUntilAction action){
    int i;
    for(i = routes.length - 1; i > 0; i--){
      if(routes[i] == action.routeNamePredicate){
        break;
      }
    }
    if(i < 0){
      i = 0;
    }

    final List<String> result = routes.sublist(0, i);
    result.add(action.route);

    return RouteState(routes: result);
  }
}
