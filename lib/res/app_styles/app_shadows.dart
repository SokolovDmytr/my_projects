import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class AppShadows {
  static List<BoxShadow> get buttonBlackShadow {
    return [
      BoxShadow(
        color: AppColors.black80,
        blurRadius: 5,
        offset: Offset(0.0, 2.0),
      ),
    ];
  }

  static List<BoxShadow> get buttonOcreShadow {
    return [
      BoxShadow(
        color: AppColors.ocre,
        spreadRadius: -18.0,
        blurRadius: 15.0,
        offset: Offset(0.0, 20.0),
      ),
    ];
  }

  static List<BoxShadow> get recipeElementShadow {
    return [
      BoxShadow(
        color: AppColors.black25,
        blurRadius: 10.0,
        offset: Offset(0.0, 3.0),
      ),
    ];
  }

  static List<BoxShadow> shadowText({@required Color color}) {
    return [
      BoxShadow(
        color: color,
        blurRadius: 4.0,
        offset: Offset(0.0, 3.0),
      ),
    ];
  }

  static List<BoxShadow> get textFieldShadow {
    return [
      BoxShadow(
        color: AppColors.black80,
        blurRadius: 5.0,
        offset: Offset(0.0, 2.0),
      ),
    ];
  }

  static Shadow get blurShadow {
    return Shadow(
      blurRadius: 2.0,
      color: AppColors.black25,
    );
  }
}
