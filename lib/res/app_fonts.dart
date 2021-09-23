import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class AppFonts{
  TextStyle get bigLetterTextStyle{
    return GoogleFonts.roboto(
      fontSize: 34.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get normalBlackTextStyle{
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      height: 30.0,
    );
  }

  TextStyle get normalBlackTwoTextStyle{
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get normalMediumTextStyle{
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get normalLightTextStyle{
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle get mediumTextStyle{
    return GoogleFonts.roboto(
      fontSize: 20.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get medium16TextStyle{
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      height: 24.0,
    );
  }

  TextStyle get medium16blackTwoTextStyle{
    return GoogleFonts.roboto(
      fontSize: 16.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w400,
      height: 24.0,
    );
  }

  TextStyle get smallBoldBlackTwoTextStyle{
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.bold,
      height: 16.0,
    );
  }

  TextStyle get smallTextStyle{
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get smallBlack20TextStyle{
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.black20,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get smallBlackTwoTextStyle{
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.blackTwo,
      fontWeight: FontWeight.w400,
    );
  }
}