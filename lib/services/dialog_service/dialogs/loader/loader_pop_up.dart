import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/shared/i_loader.dart';

class LoaderPopUp extends ILoader {
  LoaderPopUp({
    required bool state,
    required LoaderKey loaderKey,
    required String title,
    required Widget child,
  }) : super(
          state: state,
          loaderKey: loaderKey,
          title: title,
          child: child,
        );

  @override
  void show() {
    DialogService.instance.show(dialog: this);
  }

  @override
  Widget get widget => child;
}
