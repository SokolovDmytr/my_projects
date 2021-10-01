import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class NavigateFavouritesAction {
  final Store<AppState> store;

  const NavigateFavouritesAction({
    @required this.store,
  });
}
