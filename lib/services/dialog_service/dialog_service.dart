import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/shared/i_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class DialogService {
  static const tag = '[DialogService]';

  DialogService._privateConstructor();

  static final DialogService _instance = DialogService._privateConstructor();

  static DialogService get instance => _instance;

  bool _isDisplayed = false;

  bool get isDisplayed => _isDisplayed;

  void show({required IDialog dialog}) {
    if (_isDisplayed) {
      logger.e('$tag => <_display> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be showed.');
      return;
    }

    _isDisplayed = true;

    showDialog(
      context: RouteService.instance.navigatorKey.currentState!.context,
      barrierDismissible: false,
      barrierColor: AppColors.black.withOpacity(0.7),
      builder: (BuildContext _) => dialog.child,
    );
  }

  void close(BuildContext ctx) {
    if (!_isDisplayed) {
      logger.e('$tag => <closeDialog> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be removed.');
      return;
    }

    Navigator.of(ctx).pop();

    _isDisplayed = false;
  }
}
