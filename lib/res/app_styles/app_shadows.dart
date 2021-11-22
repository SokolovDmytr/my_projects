import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class AppShadows {
  static BoxShadow get neonGreenSpread1Shadow {
    return const BoxShadow(
      color: AppColors.neonBlue,
      spreadRadius: 1.0,
      blurRadius: 10.0,
    );
  }

  static BoxShadow get neonGreenSpread10Shadow {
    return const BoxShadow(
      color: AppColors.neonBlue,
      blurRadius: 10.0,
      spreadRadius: 10.0,
    );
  }

  static BoxShadow get blackShadowBottomRight {
    return BoxShadow(
      color: AppColors.black.withOpacity(0.8),
      blurRadius: 10.0,
      spreadRadius: 1.0,
      offset: const Offset(5.0, 5.0),
    );
  }

  static BoxShadow get greyShadowTopLeft {
    return BoxShadow(
      color: AppColors.white.withOpacity(0.2),
      blurRadius: 10.0,
      spreadRadius: 1.0,
      offset: const Offset(-5.0, -5.0),
    );
  }

  static BoxShadow get whiteShadow {
    return BoxShadow(
      color: AppColors.white.withOpacity(0.2),
      blurRadius: 10.0,
      spreadRadius: 5.0,
    );
  }
}
