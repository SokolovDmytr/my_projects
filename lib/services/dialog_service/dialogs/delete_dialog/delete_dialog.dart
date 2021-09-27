import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';

class DeleteDialog implements IDialog {
  @override
  Widget child;

  DeleteDialog({@required this.child});

  @override
  void show() {
    DialogService.instance.show(this);
  }
}
