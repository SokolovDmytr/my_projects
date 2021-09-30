import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/start_loading_action.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/stop_loading_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

enum LoaderKey {
  initializationLoading,
  checkIdLoading,
  getData,
}

class LoaderState {
  List<ILoader> loaders;

  LoaderState({
    @required this.loaders,
  });

  factory LoaderState.initial() {
    return LoaderState(
      loaders: <ILoader>[],
    );
  }

  LoaderState copyWith({
    List<ILoader> loaders,
  }) {
    return LoaderState(
      loaders: loaders ?? this.loaders,
    );
  }

  LoaderState reducer(dynamic action) {
    return Reducer<LoaderState>(
      actions: HashMap.from({
        StartLoadingAction: (dynamic action) => _startLoadIndicator(action),
        StopLoadingAction: (dynamic action) => _stopLoadIndicator(action),
      }),
    ).updateState(action, this);
  }

  LoaderState _startLoadIndicator(StartLoadingAction action) {
    loaders.add(action.loader);
    loaders.last.show();
    return LoaderState(loaders: loaders);
  }

  LoaderState _stopLoadIndicator(StopLoadingAction action) {
    return LoaderState(
      loaders: loaders..removeWhere((element) => element.loaderKey == action.loaderKey),
    );
  }
}
