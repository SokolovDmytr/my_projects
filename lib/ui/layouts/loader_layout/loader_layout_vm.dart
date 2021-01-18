import 'package:flutter/cupertino.dart';
import 'package:base_project_template/services/dialog_service/shared/i_loader.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

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
