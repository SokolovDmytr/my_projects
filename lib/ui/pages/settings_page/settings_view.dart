import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/widgets/description_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/widgets/language_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/widgets/log_out_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/widgets/notification_block.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsPageLanguage _language = FlutterDictionary.instance.language.settingsPageLanguage;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarType: AppBarType.simple,
      isMainStyleAppBar: true,
      title: _language.settings,
      gradient: AppGradient.wheatMarigoldGradient,
      currentPage: AppRoutes.settings,
      onTapBack: RouteSelectors.doPop(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 90.0),
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
