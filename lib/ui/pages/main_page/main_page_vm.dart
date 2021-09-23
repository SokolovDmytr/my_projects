import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

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
