import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/layouts/main_layout/main_layout.dart';
import 'package:yellow_team_fridge/ui/pages/notification_page/notification_page_vm.dart';
import 'package:yellow_team_fridge/ui/pages/notification_page/widgets/version_option.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage() : super(key: Key('NotificationPage'));

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    final NotificationPageLanguage _language =
        FlutterDictionary.instance.language?.notificationPageLanguage ?? en.notificationPageLanguage;
    return StoreConnector<AppState, NotificationPageViewModel>(
      converter: NotificationPageViewModel.init,
      builder: (context, vm) => MainLayout(
        appBarType: AppBarType.simple,
        isMainStyleAppBar: true,
        title: _language.notification,
        gradient: AppGradient.wheatMarigoldGradient,
        onTapBack: vm.onTapBack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 62.0,
              ),
              VersionOption(
                title: '${_language.version} 1.1',
                newKey: '${_language.version} 1.1',
                openedText: _language.versionDescriptionOne,
              ),
              VersionOption(
                title: '${_language.version} 1.2',
                newKey: '${_language.version} 1.2',
                openedText: _language.versionDescriptionTwo,
              ),
              VersionOption(
                title: '${_language.version} 1.3',
                newKey: '${_language.version} 1.3',
                openedText: _language.versionDescriptionThree,
              ),
              VersionOption(
                title: '${_language.version} 1.4',
                newKey: '${_language.version} 1.4',
                openedText: _language.versionDescriptionFour,
              ),
              VersionOption(
                title: '${_language.version} 1.5',
                newKey: '${_language.version} 1.5',
                openedText: _language.versionDescriptionFive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
