import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/text_field_loader/text_field_loader.dart';
import 'package:yellow_team_fridge/services/dialog_service/shared/i_loader.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/hide_loader_action.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/show_loader_action.dart';
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
        ShowLoaderAction: (dynamic action) => _showLoader(),
        HideLoaderAction: (dynamic action) => _hideLoader(),
      }),
    ).updateState(action, this);
  }

  LoaderState _startLoadIndicator(StartLoadingAction action) {
    loaders.add(action.loader);
    return LoaderState(loaders: loaders);
  }

  LoaderState _stopLoadIndicator(StopLoadingAction action) {
    return copyWith();
  }

  LoaderState _showLoader() {
    loaders.last.show();

    return copyWith();
  }

  LoaderState _hideLoader() {
    (loaders.last as TextFieldLoader).hide();

    return copyWith();
  }
}
