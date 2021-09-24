import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GlobalButton(
          key: UniqueKey(),
          width: 150.0,
          height: 56.0,
          text: 'Log in',
          fontText: AppFonts.normalMediumTextStyle,
          onTap: () {},
          gradient: AppGradient.wheatMarigoldGradient,
          borderColor: AppColors.marigold,
          shadows: AppShadows.buttonOcreShadow,
        ),
      ),
    );
  }
}
