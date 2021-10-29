import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  double? _widthScreen;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.wheat,
      ),
    );

    Future.delayed(
      AppDuration.defaultDurationForSplashScreen,
      () {
        BlocProvider.of<ApplicationTokenCubit>(context).state.token?.token == emptyString ||
                BlocProvider.of<ApplicationTokenCubit>(context).state.token?.token == null
            ? RouteSelectors.goToAuthPage().call()
            : RouteSelectors.goToOnBoardingPage().call();
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _widthScreen = _widthScreen ?? MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wheat,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(67.0, 93.0, 67.0, 40.0),
              child: Image.asset(
                ImageAssets.splashScreenFridge,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 160.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: LinearProgressIndicator(
                minHeight: 8.0,
                backgroundColor: AppColors.white,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.marigold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
