import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';
import 'package:yellow_team_fridge/ui/pages/notification_page/widgets/version_option.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage() : super(key: Key('NotificationPage'));

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationPageLanguage _language =
      FlutterDictionary.instance.language?.notificationPageLanguage ?? en.notificationPageLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        isMainStyleAppBar: true,
        preferredSize: Size.fromHeight(88.0),
        title: _language.notification,
        textButton: _language.back,
        gradient: AppGradient.wheatMarigoldGradient,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
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
