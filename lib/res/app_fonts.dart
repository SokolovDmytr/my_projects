import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/res/consts.dart';

class AppFonts {
  static TextStyle get pixelWhite60NeonShadow {
    return TextStyle(
      fontFamily: arcadeFont,
      color: AppColors.white,
      fontSize: 32.0,
      letterSpacing: 2.0,
      shadows: [
        AppShadows.neonGreenSpread10Shadow,
      ],
    );
  }

  static TextStyle get robotoWhite18BoldOpacity065 {
    return GoogleFonts.roboto(
      color: AppColors.white.withOpacity(0.65),
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get robotoWhite18BoldOpacity03 {
    return GoogleFonts.roboto(
      color: AppColors.white.withOpacity(0.3),
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    );
  }
}
