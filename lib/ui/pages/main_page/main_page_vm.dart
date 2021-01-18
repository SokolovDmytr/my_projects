import 'package:flutter/material.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

///[MainPageVM] view model for MainPage
///[exitDialog] - void function for getting exit dialog function
class MainPageVM {
  final void Function() exitDialog;

  MainPageVM({
    @required this.exitDialog,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      /// Another
    );
  }
}
