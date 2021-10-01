import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';

class QuitAppDialog extends IDialog {
  QuitAppDialog({@required Widget child,}) : super(child: child);

  @override
  void show() {
    DialogService.instance.show(dialog: this);
  }
}
