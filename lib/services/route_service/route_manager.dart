import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class RouteManager {
  static final RouteManager _instance = RouteManager._();

  static RouteManager get instance => _instance;

  final List<String> _routes = [];

  RouteManager._();

  int get routesCount => _routes.length;

  String? get currentRoute => _routes.isNotEmpty ? _routes.last : null;

  List<String>? get routesList => _routes.isNotEmpty ? _routes : null;

  bool get canPop {
    return RouteService.instance.navigatorKey.currentState!.canPop() && _routes.length > 1;
  }

  void pop() {
    if (_isDialogDisplayed()) return;
    if (_routes.isEmpty) return;

    _routes.removeLast();

    logger.i('<pop> => Did pop!');
    return Navigator.of(RouteService.instance.navigatorKey.currentState!.context).pop();
  }

  void push({
    required String route,
  }) {
    if (_isDialogDisplayed()) ;
    if (_routes.isNotEmpty && _routes.last == route) ;

    _routes.add(route);

    logger.i('<push> => Did push! $route');
    Navigator.of(RouteService.instance.navigatorKey.currentState!.context).pushNamed(route);
    return;
  }

  void pushAndRemoveUntil({
    required String route,
    required String routeNamePredicate,
  }) {
    if (_isDialogDisplayed()) return;
    if (_routes.isNotEmpty && _routes.last == route) return;

    for (int index = _routes.length - 1; index > 0; index--) {
      if (_routes[index] == routeNamePredicate) {
        break;
      } else {
        _routes.removeLast();
      }
    }

    _routes.add(route);

    logger.i('<pushAndRemoveUntil> => Did pushAndRemoveUntil! $route');

    Navigator.of(RouteService.instance.navigatorKey.currentState!.context).pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(routeNamePredicate),
    );
    return;
  }

  void replace({required String route, bool? needCheckLastRoute}) {
    if (_isDialogDisplayed()) return;
    if (_routes.isNotEmpty && _routes.last == route && needCheckLastRoute != null && needCheckLastRoute) return;

    _routes.removeLast();
    logger.i('<replace> => Did replace! $route');
    _routes.add(route);

    Navigator.of(RouteService.instance.navigatorKey.currentState!.context).pushReplacementNamed(route);
    return;
  }

  bool _isDialogDisplayed() => DialogService.instance.isDisplayed;
}
