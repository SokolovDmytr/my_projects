import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/start_loading_action.dart';

class LoaderSelectors {
  static void addLoader({@required Store<AppState> store, @required ILoader loader}) {
    store.dispatch(
      StartLoadingAction(
        loader: loader,
      ),
    );
  }
}
