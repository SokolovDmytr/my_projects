import 'package:flutter/material.dart';

/// Dialog Interface. All Dialogs models in the app should be extended from this interface.
/// Methods:
///   - [show] public method what accept [DisplayFunction] from [DialogService] and will build a current dialog.
abstract class IDialog {
  void show(DisplayFunction display);
}

/// Display function it function in the [DialogService] what will track a [IDialog] state.
typedef DisplayFunction = void Function(BuilderFunction);

/// [BuilderFunction] it function what will accept [DisplayFunction] from [IDialog]. This function will using for build dialog.
typedef BuilderFunction = Future<void> Function(BuildContext context);