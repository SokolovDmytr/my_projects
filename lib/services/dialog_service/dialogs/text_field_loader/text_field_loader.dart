import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/text_field_loader/text_field_loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/shared/i_loader.dart';

class TextFieldLoader extends ILoader {
  const TextFieldLoader({
    required bool state,
    required LoaderKey loaderKey,
    required String title,
    required Widget child,
  }) : super(
          state: state,
          loaderKey: loaderKey,
          title: title,
          child: child,
        );

  @override
  void show() {
    (widget as TextFieldLoaderWidget).rebuild(true);
  }

  void hide() {
    (widget as TextFieldLoaderWidget).rebuild(false);
  }

  @override
  Widget get widget => child;
}
