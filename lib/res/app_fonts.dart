import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

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

  static TextStyle get normalBlackTwoTextStyle {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w700,
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

  static TextStyle get medium16TextStyle {
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
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
}
