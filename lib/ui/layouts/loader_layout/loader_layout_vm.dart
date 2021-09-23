import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

///[LoaderLayoutVM] is view model for loaders
///[loaders] contains list with loaders

class LoaderLayoutVM {
  final List<ILoader> loaders;

  LoaderLayoutVM({
    @required this.loaders,
  });

  static LoaderLayoutVM fromStore(Store<AppState> store) {
    return LoaderLayoutVM(
     // loaders: store.state.loaderState.loaders,
    );
  }
}
