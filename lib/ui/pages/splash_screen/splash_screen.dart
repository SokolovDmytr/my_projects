import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yellow_team_fridge/res/app_duration.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/ui/pages/on_boarding_screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  double _widthScreen;

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
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        ),
      ),
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
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(67.0, 93.0, 67.0, 210.0),
              child: Image.asset(
                ImageAssets.splashScreenFridge,
              ),
            ),
            Positioned(
              bottom: 0.0,
              width: _widthScreen,
              child: Container(
                margin: const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 172.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: LinearProgressIndicator(
                    minHeight: 8.0,
                    backgroundColor: AppColors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.marigold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
