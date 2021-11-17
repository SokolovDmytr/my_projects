import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';

class AppFonts {
  static TextStyle get pixelWhite60NeonShadow {
    return TextStyle(
      fontFamily: 'Progress',
      color: AppColors.white,
      fontSize: 60.0,
      letterSpacing: 2.0,
      shadows: [
        AppShadows.neonGreenSpread10Shadow,
      ],
    );
  }

  static TextStyle get memeName {
    return GoogleFonts.roboto(
      color: AppColors.white.withOpacity(0.65),
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get memeHint {
    return GoogleFonts.roboto(
      color: AppColors.white.withOpacity(0.65),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get inputText {
    return GoogleFonts.roboto(
      color: AppColors.white.withOpacity(0.65),
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    );
  }
}
