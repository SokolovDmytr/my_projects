import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:base_project_template/services/dialog_service/shared/i_loader.dart';
import 'package:base_project_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:base_project_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:base_project_template/store/shared/reducer.dart';

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
      }),
    ).updateState(action, this);
  }


}
