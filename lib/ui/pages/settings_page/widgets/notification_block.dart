import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/ui/pages/notification_page/notification_page.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/widgets/settings_layout_option_widget.dart';

class NotificationBlock extends StatelessWidget {
  NotificationBlock() : super(key: Key('NotificationBlock'));
  final NotificationPageLanguage _language =
      FlutterDictionary.instance.language?.notificationPageLanguage ?? en.notificationPageLanguage;

  @override
  Widget build(BuildContext context) {
    return SettingsLayoutOptionWidget(
      newKey: 'NotificationBlockLayout',
      icon: Icons.arrow_forward_ios_rounded,
      title: _language.notification,
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage())),
    );
  }
}
