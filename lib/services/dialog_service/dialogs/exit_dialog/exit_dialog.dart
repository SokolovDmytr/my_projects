import 'package:flutter/material.dart';
import 'package:base_project_template/services/dialog_service/shared/i_dialog.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_builders.dart';
import 'package:base_project_template/services/dialog_service/dialogs/exit_dialog/exit_dialog_widget.dart';

/// [ExitDialog] realisation for [IDialog] interface. This [dialog] was using for show to confirm exit from application.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class ExitDialog implements IDialog {
  /// [ExitDialog] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
    //  widget: ExitDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}
