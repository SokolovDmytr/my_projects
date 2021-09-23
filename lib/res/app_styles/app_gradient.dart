import 'package:base_project_template/res/app_styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static LinearGradient get overflowTopWhiteGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.kWhite.withOpacity(1.0),
        AppColors.kWhite.withOpacity(0.6),
        AppColors.kWhite.withOpacity(0.3),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowBottomWhiteGradient {
    return LinearGradient(
      end: Alignment.topCenter,
      begin: Alignment.bottomCenter,
      colors: [
        AppColors.kWhite.withOpacity(1.0),
        AppColors.kWhite.withOpacity(0.6),
        AppColors.kWhite.withOpacity(0.3),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowTopGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowBottomGradient {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowLeftGradient {
    return LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowRightGradient {
    return LinearGradient(
      colors: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }
}
