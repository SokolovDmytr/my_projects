import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/description_block.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/language_block.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/log_out_block.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/notification_block.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: Key('SettingsPage'));

  @override
  Widget build(BuildContext context) {
    final SettingsPageLanguage _language =
        FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;
    return Scaffold(
      appBar: CustomAppBar(
        isMainStyleAppBar: true,
        preferredSize: Size.fromHeight(88.0),
        title: _language.settings,
        textButton: _language.back,
        gradient: AppGradient.wheatMarigoldGradient,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            SizedBox(
              height: 90.0,
            ),
            LogOutBlock(),
            LanguageBlock(),
            NotificationBlock(),
            DescriptionBlock(),
          ],
        ),
      ),
    );
  }
}
