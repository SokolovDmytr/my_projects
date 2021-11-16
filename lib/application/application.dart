import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_bloc.dart';
import 'package:memes/services/route_service/route_service.dart';
import 'package:memes/ui/pages/splash_screen/spalsh_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApplicationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteService.instance.onGenerateRoute,
        navigatorKey: RouteService.instance.navigatorKey,
        home: SplashScreen(),
      ),
    );
  }
}
