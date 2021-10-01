import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/shared/loader/loader_state.dart';

class LoaderPopUp implements ILoader {
  @override
  Widget child;
  @override
  bool state;
  @override
  LoaderKey loaderKey;
  @override
  String title;

  LoaderPopUp({
    @required this.state,
    @required this.loaderKey,
    @required this.title,
    @required this.child,
  });

  @override
  void show() {
    DialogService.instance.show(dialog: this);
  }

  @override
  Widget get widget => child;
}
