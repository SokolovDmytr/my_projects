import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/layouts/main_layout/main_layout.dart';
import 'package:yellow_team_fridge/ui/pages/auth_page/auth_page.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/settings_page_vm.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/description_block.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/language_block.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/log_out_block.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/notification_block.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: Key('SettingsPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsPageViewModel>(
      converter: SettingsPageViewModel.init,
      builder: (BuildContext context, SettingsPageViewModel vm) {
        final SettingsPageLanguage _language =
            FlutterDictionary.instance.language?.settingsPageLanguage ??
                en.settingsPageLanguage;
        return MainLayout(
          appBarType: AppBarType.simple,
          isMainStyleAppBar: true,
          title: _language.settings,
          gradient: AppGradient.wheatMarigoldGradient,
          currentPage: AppRoutes.settings,
          onTapBack: () => vm.onTapBack(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 90.0,
                ),
                LogOutBlock(),
                LanguageBlock(),
                NotificationBlock(),
                DescriptionBlock(),
                //need to delete
                InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AuthPage())),
                  child: Container(
                    color: AppColors.black,
                    height: 100.0,
                    width: 200.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
