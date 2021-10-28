import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/shared/i_dialog.dart';

class RemoveFavouriteDialog extends IDialog {
  const RemoveFavouriteDialog({
    required Widget child,
  }) : super(child: child);

  @override
  void show() {
    DialogService.instance.show(dialog: this);
  }
}
