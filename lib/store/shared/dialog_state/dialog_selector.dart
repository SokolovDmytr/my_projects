
import 'package:base_project_template/store/application/app_state.dart';
import 'package:base_project_template/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:base_project_template/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:redux/redux.dart';

/// [DialogSelectors] it class with static functions for work with Dialogs from Pages.
/// Functions:
///   - [isDialogDisplayed]. This function was get the current dialog status.
///   - [getCloseDialogFunction]. This function was get function for close any dialogs.
///   - [getShowErrorDialogFunction]. This function is getting function for showing error dialog.
///   - [getInternetConnectionDialogFunction]. This function is getting function for showing lost internet connection dialog.
///   - [getExitDialogFunction]. This function is getting function for showing exit dialog.
class DialogSelectors {

  static void Function(String message) getShowErrorDialogFunction(Store<AppState> store) {
    //return (String message) => store.dispatch(ShowDialogAction(dialog: ErrorDialog(message: message)));
  }

}
