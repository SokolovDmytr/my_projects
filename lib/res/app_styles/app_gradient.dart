import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class AppGradient {
  static LinearGradient get wheatMarigoldGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.wheat,
        AppColors.marigold,
      ],
      tileMode: TileMode.mirror,
    );
  }

  static LinearGradient get marigoldWheatGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.marigold,
        AppColors.wheat,
      ],
    );
  }

  static LinearGradient get black30black0 {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.black25,
        AppColors.black20,
      ],
    );
  }
}
