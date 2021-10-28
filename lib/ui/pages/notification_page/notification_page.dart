import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/widgets/version_option.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage() : super(key: UniqueKey());

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final NotificationPageLanguage _language = FlutterDictionary.instance.language?.notificationPageLanguage ?? en.notificationPageLanguage;
    return MainLayout(
      appBarType: AppBarType.simple,
      isMainStyleAppBar: true,
      title: _language.notification,
      gradient: AppGradient.wheatMarigoldGradient,
      onTapBack: RouteSelectors.doPop(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 62.0),
                  child: VersionOption(
                    newKey: UniqueKey(),
                    title: 'a',
                    openedText: 'b',
                  ),
                )
              : VersionOption(
                  newKey: UniqueKey(),
                  title: 'a',
                  openedText: 'b',
                );
        },
      ),
    );
  }
}
