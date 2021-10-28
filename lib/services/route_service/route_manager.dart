import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';


class RouteManager {
  static final RouteManager _instance = RouteManager._();

  static RouteManager get instance => _instance;

  final List<String> _routes;

  RouteManager._() : _routes = [];

  int get routesCount => _routes.length;

  String get currentRoute => _routes.isNotEmpty ? _routes.last : null;

  List<String> get routesList => _routes.isNotEmpty ? _routes : null;

  bool get canPop {
    return NavigatorHolder.navigatorKey.currentState.canPop() && _routes.length > 1;
  }

  NavigateToAction pop() {
    if (_isDialogDisplayed()) return null;
    if (_routes == null || _routes.isEmpty) return null;

    _routes.removeLast();

    logger.i('<pop> => Did pop!');
    return NavigateToAction.pop();
  }

  NavigateToAction push({
    required String route,
  }) {
    if (_routes == null || _isDialogDisplayed()) return null;
    if (_routes.isNotEmpty && _routes.last == route) return null;

    _routes.add(route);

    logger.i('<push> => Did push! $route');
    return NavigateToAction.push(route);
  }

  NavigateToAction pushAndRemoveUntil({
    required String route,
    required String routeNamePredicate,
  }) {
    if (_routes == null || _isDialogDisplayed()) return null;
    if (_routes.isNotEmpty && _routes.last == route) return null;

    for (int index = _routes.length - 1; index > 0; index--) {
      if (_routes[index] == routeNamePredicate) {
        break;
      } else {
        _routes.removeLast();
      }
    }

    _routes.add(route);

    logger.i('<pushAndRemoveUntil> => Did pushAndRemoveUntil! $route');

    return NavigateToAction.pushNamedAndRemoveUntil(route, ModalRoute.withName(routeNamePredicate));
  }

  NavigateToAction replace({required String route, bool needCheckLastRoute}) {
    if (_routes == null || _isDialogDisplayed()) return null;
    if (_routes.isNotEmpty && _routes.last == route && needCheckLastRoute) return null;

    _routes.removeLast();
    logger.i('<replace> => Did replace! $route');
    _routes.add(route);

    return NavigateToAction.replace(route);
  }

  bool _isDialogDisplayed() => DialogService.instance.isDisplayed;
}
