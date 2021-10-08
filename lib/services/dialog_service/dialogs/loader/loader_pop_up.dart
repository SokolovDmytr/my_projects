import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/shared/loader/loader_state.dart';

class LoaderPopUp extends ILoader {
  LoaderPopUp({
    @required bool state,
    @required LoaderKey loaderKey,
    @required String title,
    @required Widget child,
  }) : super(state: state, loaderKey: loaderKey, title: title, child: child,);

  @override
  void show() {
    DialogService.instance.show(dialog: this);
  }

  @override
  Widget get widget => child;
}
