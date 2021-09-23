import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

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
