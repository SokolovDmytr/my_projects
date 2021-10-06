import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class NavigateFavouritesAction extends BaseAction {
  final Store<AppState> store;

  const NavigateFavouritesAction({
    @required this.store,
  });
}
