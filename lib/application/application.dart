import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/res/keys.dart';
import 'package:fridge_yellow_team_bloc/res/locales.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/splash_screen/splash_screen.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/home_page.dart';

class Application extends StatelessWidget {
  Application() : super(key: Key(ApplicationKeys.application));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
