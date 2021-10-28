import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';

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

  static LinearGradient get whiteWhite0 {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.white0,
        AppColors.white.withOpacity(0.7),
      ],
    );
  }

  static LinearGradient get white {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.white,
        AppColors.white,
      ],
    );
  }

  static LinearGradient get transparent {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.transparent,
        AppColors.transparent,
      ],
    );
  }
}
