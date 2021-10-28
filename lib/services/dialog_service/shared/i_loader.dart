import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/shared/i_dialog.dart';

class ILoader extends IDialog {
  final bool state;
  final String title;
  final LoaderKey loaderKey;

  const ILoader({
    required this.state,
    required this.loaderKey,
    required this.title,
    required Widget child,
  }) : super(child: child);

  Widget get widget {
    return child;
  }

  @override
  void show() {}
}
