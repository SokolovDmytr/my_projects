import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/widgets/settings_layout_option_widget.dart';

class NotificationBlock extends StatelessWidget {
  NotificationBlock() : super(key: UniqueKey());
  final NotificationPageLanguage _language = FlutterDictionary.instance.language.notificationPageLanguage;

  @override
  Widget build(BuildContext context) {
    return SettingsLayoutOptionWidget(
      newKey: UniqueKey(),
      icon: Icons.arrow_forward_ios_rounded,
      title: _language.notification,
      onTap: RouteSelectors.goToNotificationPage(),
    );
  }
}
