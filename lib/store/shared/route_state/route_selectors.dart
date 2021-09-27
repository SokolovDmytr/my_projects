import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_pop_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_and_remove_until_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_replace_action.dart';

class RouteSelectors {
  static void pop({
    @required Store<AppState> store,
  }) {
    store.dispatch(
      NavigatePopAction(),
    );
  }

  static void pushReplaceNamed({
    @required Store<AppState> store,
    @required String route,
  }) {
    store.dispatch(
      NavigateReplaceAction(route: route),
    );
  }

  static void pushNamed({
    @required Store<AppState> store,
    @required String route,
  }) {
    store.dispatch(
      NavigatePushNamedAction(route: route),
    );
  }

  static void pushNamedAndRemoveUntil({
    @required Store<AppState> store,
    @required String route,
    @required String routeNamePredicate,
  }) {
    store.dispatch(
      NavigatePushNamedAndRemoveUntilAction(
        route: route,
        routeNamePredicate: routeNamePredicate,
      ),
    );
  }
}
