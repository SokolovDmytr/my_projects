import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/res/keys.dart';
import 'package:yellow_team_fridge/services/route_service/route_service.dart';
import 'package:yellow_team_fridge/services/user_information_service/user_information_service.dart';
import 'package:yellow_team_fridge/store/application/action/init_app_action.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/language_state/language_vm.dart';
import 'package:yellow_team_fridge/ui/pages/splash_screen/splash_screen.dart';

/// The [Application] class, in which the creation of [MaterialApp] takes place.
/// It takes [store] as a parameter, which is initialized in [main].
/// As [key], we set the string, "Application", which is inside [ApplicationKeys].
class Application extends StatefulWidget {
  final Store<AppState> store;

  Application({this.store}) : super(key: Key(ApplicationKeys.application));

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused) {
      UserInformationService.instance.saveInformation();
    }
  }

  /// Here he connects to [StoreProvider], so that the application has one [widget.store].
  /// In the [navigatorKey] option, we will write [NavigatorHolder] to NavigateToAction.
  /// Also, all rootes are connected here, in [onGenerateRoute].
  /// Also here is installed, the standard [locale], which can change in the course of the application.
  /// In [supportedLocales], we specify which languages will be used by the application.
  /// In [localizationsDelegates], we connect delegates.
  /// In the [builder] function, we specify the [textScaleFactor] that will be used throughout the application.
  /// After initialization, we will move to [SplashScreen].
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        onInitialBuild: (AppState state) => widget.store.dispatch(InitAppAction(),),
        builder: (BuildContext context, AppState state) {
          return StoreConnector<AppState, LanguageViewModel>(
            converter: LanguageViewModel.init,
            builder: (BuildContext context, LanguageViewModel vm) => MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: RouteService.instance.navigatorKey,
              onGenerateRoute: (RouteSettings settings) => RouteService.instance.onGenerateRoute(settings: settings),
              home: SplashScreen(),
              locale: Locale(vm.language),
              supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
              localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ),
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
