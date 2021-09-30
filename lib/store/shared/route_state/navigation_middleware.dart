import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/services/route_service.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_pop_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_and_remove_until_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_replace_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/update_list_routes.dart';

class NavigationMiddleware<T> implements MiddlewareClass<T> {
  NavigationMiddleware();

  @override
  dynamic call(Store<T> store, dynamic action, NextDispatcher next) {
    if (action is NavigatePushNamedAction) {
      final routeName = action.route;

      if ((store.state as AppState).routeState.routes.last != routeName) {
        RouteService.instance.navigatorKey.currentState.pushNamed(routeName);

        final List<String> newListRoutes = (store.state as AppState).routeState.routes;
        newListRoutes.add(routeName);

        next(
          UpdateListRoutes(routes: newListRoutes),
        );
      } else {
        return;
      }
    }

    if (action is NavigatePopAction) {
      if ((store.state as AppState).routeState.routes.length > 1) {
        RouteService.instance.navigatorKey.currentState.pop();

        final List<String> newListRoutes = (store.state as AppState).routeState.routes;
        newListRoutes.removeLast();

        next(
          UpdateListRoutes(routes: newListRoutes),
        );
      } else {
        return;
      }
    }

    if (action is NavigateReplaceAction) {
      final routeName = action.route;

      if ((store.state as AppState).routeState.routes.last != routeName) {
        RouteService.instance.navigatorKey.currentState.pushReplacementNamed(routeName);

        final List<String> newListRoutes = (store.state as AppState).routeState.routes;
        newListRoutes.removeLast();
        newListRoutes.add(routeName);

        next(UpdateListRoutes(routes: newListRoutes));
      } else {
        return;
      }
    }

    if (action is NavigatePushNamedAndRemoveUntilAction) {
      final routeName = action.route;

      if ((store.state as AppState).routeState.routes.last != routeName) {
        RouteService.instance.navigatorKey.currentState.pushNamedAndRemoveUntil(
          routeName,
          ModalRoute.withName(action.routeNamePredicate),
        );

        final List<String> newListRoutes = (store.state as AppState).routeState.routes;
        int i;
        for (i = newListRoutes.length - 1; i > 0; i--) {
          if (newListRoutes[i] == action.routeNamePredicate) {
            break;
          }
        }
        if (i < 0) {
          i = 0;
        }

        final List<String> result = newListRoutes.sublist(0, i);
        result.add(action.route);
        next(
          UpdateListRoutes(routes: result),
        );
      } else {
        return;
      }
    }

    next(action);
  }
}
