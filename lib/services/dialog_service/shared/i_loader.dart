import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';
import 'package:yellow_team_fridge/store/shared/loader/loader_state.dart';

class ILoader extends IDialog {
  final bool state;
  final String title;
  final LoaderKey loaderKey;

  ILoader({
    @required this.state,
    @required this.loaderKey,
    @required this.title,
  });

  Widget get widget {
    return Container();
  }

  @override
  void show(DisplayFunction displayFunction) {}
}
