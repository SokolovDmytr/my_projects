import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';
import 'package:yellow_team_fridge/services/route_service.dart';

class DialogService {
  static const tag = '[DialogService]';

  DialogService._privateConstructor();

  static final DialogService _instance = DialogService._privateConstructor();

  static DialogService get instance => _instance;

  void show({@required IDialog dialog}) {
    final BuildContext ctx = RouteService.instance.navigatorKey.currentState.context;

    showDialog(
      context: ctx,
      barrierDismissible: true,
      barrierColor: AppColors.black.withOpacity(0.7),
      builder: (BuildContext _) => dialog.child,
    );
  }
}
