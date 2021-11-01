import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/ingredients_cubit.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/language_cubit.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/recipes_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/res/keys.dart';
import 'package:fridge_yellow_team_bloc/res/locales.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/splash_screen/splash_screen.dart';

class Application extends StatelessWidget {
  Application() : super(key: Key(ApplicationKeys.application));

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
        )
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
