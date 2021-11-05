import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_event.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/notification_message.dart';
import 'package:fridge_yellow_team_bloc/repositories/auth_repository.dart';
import 'package:fridge_yellow_team_bloc/repositories/ingredient_repository.dart';
import 'package:fridge_yellow_team_bloc/repositories/recipe_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/keys.dart';
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
  late NotificationPageCubit _notificationPageCubit;
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();

    _notificationPageCubit = NotificationPageCubit();
    _languageBloc = LanguageBloc();

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen(
      (message) {
        _notificationPageCubit.addNotification(
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
        _notificationPageCubit.addNotification(
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
  void dispose() {
    if (!_notificationPageCubit.isClosed) {
      _notificationPageCubit.close();
      _languageBloc.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _notificationPageCubit,
        ),
        BlocProvider(
          create: (BuildContext _) => ApplicationTokenCubit(
            repository: AuthRepository.instance,
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext _) => IngredientsBloc(
            repository: IngredientRepository.instance,
          )..add(
              LoadAllIngredientsEvent(),
            ),
        ),
        BlocProvider(
          create: (BuildContext _) => RecipesBloc(
            repository: RecipeRepository.instance,
          ),
        ),
        BlocProvider.value(
          value: _languageBloc,
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (BuildContext context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          onGenerateRoute: RouteService.instance.onGenerateRoute,
          navigatorKey: RouteService.instance.navigatorKey,
          locale: Locale(state.currentLocale),
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
      ),
    );
  }
}
