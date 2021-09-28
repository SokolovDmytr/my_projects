import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/settings_layout_option_widget.dart';

class LogOutBlock extends StatelessWidget {
  LogOutBlock() : super(key: Key('LogOutBlock'));
  final SettingsPageLanguage _language =
      FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;

  @override
  Widget build(BuildContext context) {
    return SettingsLayoutOptionWidget(
            newKey: 'LogOutBlockLayoutLTR',
            icon: Icons.logout,
            title: _language.logOut,
            onTap: () {},
          );
  }
}
