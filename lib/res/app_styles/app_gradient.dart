import 'package:flutter/material.dart';

import 'package:base_project_template/res/app_styles/app_colors.dart';

class AppGradient {
  static LinearGradient get overflowTopWhiteGradient {
    return  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      List: [
        AppColors.kWhite.withOpacity(1.0),
        AppColors.kWhite.withOpacity(0.6),
        AppColors.kWhite.withOpacity(0.3),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowBottomWhiteGradient {
    return  LinearGradient(
      end: Alignment.topCenter,
      begin: Alignment.bottomCenter,
      List: [
        AppColors.kWhite.withOpacity(1.0),
        AppColors.kWhite.withOpacity(0.6),
        AppColors.kWhite.withOpacity(0.3),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowTopGradient {
    return  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
        List: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowBottomGradient {
    return  LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      List: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowLeftGradient {
    return  LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      List: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowRightGradient {
    return  LinearGradient(
      List: [
        AppColors.kLightGrey.withOpacity(0.2),
        AppColors.kLightGrey.withOpacity(0.1),
        AppColors.kLightGrey.withOpacity(0.05),
        AppColors.kLightGrey.withOpacity(0.0),
      ],
    );
  }

}