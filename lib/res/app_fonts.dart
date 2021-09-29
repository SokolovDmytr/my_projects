import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';

class AppFonts {
  static TextStyle get bigLetterTextStyle {
    return GoogleFonts.roboto(
      fontSize: 34.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get normalBlackTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get normalBlackHeight30TextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      height: 1.25,
    );
  }

  static TextStyle get normalBlackTwoTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w700,
      height: 1.25,
    );
  }

  static TextStyle get normalMariGoldTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.marigold,
      fontWeight: FontWeight.w700,
      height: 1.25,
    );
  }

  static TextStyle get normalMediumTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get normalMediumMariGoldTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.marigold,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get normalLightTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get mediumTextStyle {
    return GoogleFonts.roboto(
      fontSize: 20.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get mediumShadowBlackTextStyle {
    return GoogleFonts.roboto(
      fontSize: 20.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      shadows: AppShadows.shadowText(color: AppColors.black30),
    );
  }

  static TextStyle get medium16Height24TextStyle {
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );
  }

  static TextStyle get medium16Height24WhiteTextStyle {
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );
  }

  static TextStyle get medium16Height26TextStyle {
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      height: 1.625,
    );
  }

  static TextStyle get medium16blackTwoTextStyle {
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get smallBoldBlackTwoTextStyle {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get smallTextStyle {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get smallBlack20TextStyle {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.black20,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get smallBlackTwoTextStyle {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get smallTextStyleOpacity {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.black.withOpacity(0.2),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get smallTextStyleWheatMarigoldGradient {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      foreground: Paint()
        ..shader = AppGradient.wheatMarigoldGradient.createShader(
          Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
        ),
    );
  }
}
