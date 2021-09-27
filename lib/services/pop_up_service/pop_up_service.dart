import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/services/route_service.dart';

class PopUpService {
  static const tag = '[PopUpService]';

  PopUpService._privateConstructor();

  static final PopUpService _instance = PopUpService._privateConstructor();

  static PopUpService get instance => _instance;

  void show({@required Widget widget}) {
    final BuildContext ctx = RouteService.instance.navigatorKey.currentState.context;

    showDialog(
      context: ctx,
      barrierDismissible: true,
      barrierColor: AppColors.transparent,
      builder: (BuildContext _) => widget,
    );
  }
}
