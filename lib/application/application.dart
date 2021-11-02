import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/ingredients_cubit.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/language_cubit.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/recipes_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/notification_message.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/keys.dart';
import 'package:fridge_yellow_team_bloc/res/locales.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/new_version_dialog/new_version_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/new_version_dialog/new_version_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/cubit/notification_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/splash_screen/splash_screen.dart';

class Application extends StatefulWidget {
  Application() : super(key: Key(ApplicationKeys.application));

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen(
      (message) {
        context.read<NotificationPageCubit>().addNotification(
              NotificationMessage(
                title: message.notification!.title ?? emptyString,
                body: message.notification!.body ?? emptyString,
              ),
            );
        DialogService.instance.show(
          dialog: NewVersionDialog(
            child: NewVersionDialogWidget(
              title: message.notification!.title ?? emptyString,
              body: message.notification!.body ?? emptyString,
              onTapOk: () {},
            ),
          ),
        );
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        context.read<NotificationPageCubit>().addNotification(
              NotificationMessage(
                title: message.notification!.title ?? emptyString,
                body: message.notification!.body ?? emptyString,
              ),
            );
        RouteSelectors.goToNotificationPage().call();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext _) => ApplicationTokenCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext _) => IngredientCubit()..loadAllIngredients(),
        ),
        BlocProvider(
          create: (BuildContext _) => RecipesCubit(),
        ),
        BlocProvider(
          create: (BuildContext _) => LanguageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: RouteService.instance.onGenerateRoute,
        navigatorKey: RouteService.instance.navigatorKey,
        locale: Locale(Locales.base),
        supportedLocales: FlutterDictionaryDelegate.getSupportedLocales!,
        localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child ?? const SizedBox(),
          );
        },
      ),
    );
  }
}
