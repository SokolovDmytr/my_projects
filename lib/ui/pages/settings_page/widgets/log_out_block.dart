import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/log_out_app_dialog/log_out_app_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/log_out_app_dialog/log_out_app_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/cubit/settings_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/widgets/settings_layout_option_widget.dart';

class LogOutBlock extends StatelessWidget {
  LogOutBlock() : super(key: UniqueKey());
  final SettingsPageLanguage _language = FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;

  @override
  Widget build(BuildContext context) {
    return SettingsLayoutOptionWidget(
      newKey: UniqueKey(),
      icon: Icons.logout,
      title: _language.logOut,
      onTap: () {
        DialogService.instance.show(
          dialog: LogOutAppDialog(
            child: LogOutAppDialogWidget(
              onTapYes: () {
                BlocProvider.of<SettingsPageCubit>(context).logOut();
              },
            ),
          ),
        );
      },
    );
  }
}
