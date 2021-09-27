import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/services/route_service.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_pop_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_and_remove_until_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_replace_action.dart';

class NavigationMiddleware<T> implements MiddlewareClass<T> {
  NavigationMiddleware();

  @override
  dynamic call(Store<T> store, dynamic action, NextDispatcher next) {
    if (action is NavigatePushNamedAction) {
      final routeName = action.route;

      if ((store.state as AppState).routeState.routes.last != routeName) {
        RouteService.instance.navigatorKey.currentState.pushNamed(routeName);
      }
    }

    if (action is NavigatePopAction) {
      if ((store.state as AppState).routeState.routes.length > 1) {
        RouteService.instance.navigatorKey.currentState.pop();
      }
    }

    if (action is NavigateReplaceAction) {
      final routeName = action.route;

      if ((store.state as AppState).routeState.routes.last != routeName) {
        RouteService.instance.navigatorKey.currentState.pushReplacementNamed(routeName);
      }
    }

    if (action is NavigatePushNamedAndRemoveUntilAction) {
      final routeName = action.route;

      if ((store.state as AppState).routeState.routes.last != routeName) {
        RouteService.instance.navigatorKey.currentState.pushNamedAndRemoveUntil(
          routeName,
          ModalRoute.withName(action.routeNamePredicate),
        );
      }
    }

    next(action);
  }
}
