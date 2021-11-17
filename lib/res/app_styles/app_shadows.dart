import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class AppShadows {
  static BoxShadow get neonGreenSpread1Shadow {
    return BoxShadow(
      color: AppColors.neonGreen,
      spreadRadius: 1.0,
      blurRadius: 10.0,
    );
  }

  static BoxShadow get neonGreenSpread10Shadow {
    return BoxShadow(
      color: AppColors.neonGreen,
      blurRadius: 10.0,
      spreadRadius: 10.0,
    );
  }

  static BoxShadow get blackShadow {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.8),
      blurRadius: 10.0,
      spreadRadius: 1.0,
      offset: Offset(5.0, 5.0),
    );
  }

  static BoxShadow get greyShadow {
    return BoxShadow(
      color: AppColors.white.withOpacity(0.2),
      blurRadius: 10.0,
      spreadRadius: 1.0,
      offset: Offset(-5.0, -5.0),
    );
  }
}