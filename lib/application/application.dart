import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_bloc.dart';
import 'package:memes/dictionary/flutter_delegate.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/services/route_service/route_service.dart';
import 'package:memes/ui/pages/splash_screen/splash_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApplicationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: AppColors.metallicBlue,
        ),
        onGenerateRoute: RouteService.instance.onGenerateRoute,
        navigatorKey: RouteService.instance.navigatorKey,
        locale: Locale(FlutterDictionaryDelegate.getCurrentLocale),
        supportedLocales: FlutterDictionaryDelegate.getSupportedLocales!,
        localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
        home: SplashScreen(),
      ),
    );
  }
}
