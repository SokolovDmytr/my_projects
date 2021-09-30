import 'dart:collection';

import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:yellow_team_fridge/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

/// Dialog state - it state need for work with dialogs from Epics.
/// Params:
///   - [isDialogDisplayed]. Getter what will get dialog status from [DialogService].
/// Actions:
///   - [ShowDialogAction]. Need for show any dialogs extended from [IDialog].
///   - [ForceCloseDialogAction]. Need for force close any dialogs.
class DialogState {
  DialogState();

  //bool get isDialogDisplayed => DialogService.instance.isDisplayed;

  factory DialogState.initial() {
    return DialogState();
  }

  DialogState copyWith() {
    return DialogState();
  }

  DialogState reducer(dynamic action) {
    return Reducer<DialogState>(
      actions: HashMap.from({
        ShowDialogAction: (dynamic action) => _showDialogAction(action as ShowDialogAction),
        ForceCloseDialogAction: (dynamic action) => _forceCloseDialogAction(action as ForceCloseDialogAction),
      }),
    ).updateState(action, this);
  }

  DialogState _forceCloseDialogAction(ForceCloseDialogAction action) {
    DialogService.instance.close();
    return this;
  }

  DialogState _showDialogAction(ShowDialogAction action) {
    DialogService.instance.show(dialog: action.dialog);
    return this;
  }
}
