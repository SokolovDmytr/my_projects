import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';
import 'package:yellow_team_fridge/services/route_service/route_service.dart';

class DialogService {
  static const tag = '[DialogService]';

  DialogService._privateConstructor();

  static final DialogService _instance = DialogService._privateConstructor();

  static DialogService get instance => _instance;

  bool _isDisplayed = false;

  bool get isDisplayed => _isDisplayed;

  void show({@required IDialog dialog}) {
    print('Is displayed $_isDisplayed');
    if (_isDisplayed) {
      logger.e('$tag => <_display> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be showed.');
      return;
    }

    _isDisplayed = true;

    final BuildContext ctx = RouteService.instance.navigatorKey.currentState.context;

    showDialog(
      context: ctx,
      barrierDismissible: false,
      barrierColor: AppColors.black.withOpacity(0.7),
      builder: (BuildContext _) => dialog.child,
    );
  }

  void close(){
    if(!_isDisplayed){
      logger.e('$tag => <closeDialog> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be removed.');
      return;
    }

    if(RouteService.instance.navigatorKey.currentState.canPop()) {
      RouteService.instance.navigatorKey.currentState.pop();
      _isDisplayed = false;
    }
  }
}
