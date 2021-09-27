import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';

class ErrorDialog implements IDialog {
  @override
  Widget child;

  ErrorDialog({@required this.child});

  @override
  void show() {
    DialogService.instance.show(this);
  }
}