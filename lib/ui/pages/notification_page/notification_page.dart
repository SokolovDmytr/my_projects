import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/cubit/notification_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/cubit/notification_page_state.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/widgets/version_option.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage() : super(key: UniqueKey());

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationPageLanguage _language = FlutterDictionary.instance.language.notificationPageLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationPageCubit, NotificationPageState>(
      builder: (BuildContext context, state) => MainLayout(
        appBarType: AppBarType.simple,
        isMainStyleAppBar: true,
        title: _language.notification,
        gradient: AppGradient.wheatMarigoldGradient,
        onTapBack: RouteSelectors.doPop(),
        body: ListView.builder(
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 62.0),
                    child: VersionOption(
                      newKey: UniqueKey(),
                      title: state.messages[state.messages.length - 1 - index].title,
                      openedText: state.messages[state.messages.length - 1 - index].body,
                    ),
                  )
                : VersionOption(
                    newKey: UniqueKey(),
                    title: state.messages[state.messages.length - 1 - index].title,
                    openedText: state.messages[state.messages.length - 1 - index].body,
                  );
          },
        ),
      ),
    );
  }
}
