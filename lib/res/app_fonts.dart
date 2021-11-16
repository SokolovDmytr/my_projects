import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class AppFonts {
  static TextStyle get appBarStyle {
    return GoogleFonts.roboto(
      color: AppColors.white.withOpacity(0.65),
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
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
