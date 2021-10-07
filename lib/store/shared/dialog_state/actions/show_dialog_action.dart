import 'package:yellow_team_fridge/services/dialog_service/shared/i_dialog.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

/// Action for show any dialogs what will extends from [IDialog] interface.
class ShowDialogAction extends BaseAction {
  final IDialog dialog;

  const ShowDialogAction({
    this.dialog,
  }) : super(type: 'ShowDialogAction');
}
