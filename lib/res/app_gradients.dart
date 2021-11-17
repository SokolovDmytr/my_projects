import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class AppGradients {
  static LinearGradient get metallicBlack {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.metallicBlack,
        AppColors.metallicGrey,
      ],
    );
  }

  static LinearGradient get neonLeftToRight {
    return LinearGradient(
      begin: Alignment(-1.0, -0.5),
      end: Alignment(-0.95, -0.5),
      colors: [
        AppColors.neonGreen.withOpacity(0.5),
        AppColors.transparent,
      ],
    );
  }

  static LinearGradient get neonRightToLeft {
    return LinearGradient(
      begin: Alignment(1.0, 0.5),
      end: Alignment(0.95, 0.5),
      colors: [
        AppColors.neonGreen.withOpacity(0.5),
        AppColors.transparent,
      ],
    );
  }

  static LinearGradient get neonTopToBottom {
    return LinearGradient(
      begin: Alignment(0.0, -1.0),
      end: Alignment(0.0, -0.7),
      colors: [
        AppColors.neonGreen.withOpacity(0.5),
        AppColors.transparent,
      ],
    );
  }

  static LinearGradient get neonBottomToTop {
    return LinearGradient(
      begin: Alignment(0.0, 1.0),
      end: Alignment(0.0, 0.7),
      colors: [
        AppColors.neonGreen.withOpacity(0.5),
        AppColors.transparent,
      ],
    );
  }

  static LinearGradient get greyTopLeftToBottomRight {
    return LinearGradient(
      begin: Alignment(-1.0, -1.0),
      end: Alignment(1.0, 1.0),
      colors: [
        AppColors.metallicGrey,
        AppColors.metallicBlack,
      ],
    );
  }

  static LinearGradient get metallicLeftToRight {
    return LinearGradient(
      begin: Alignment(-1.0, -0.5),
      end: Alignment(-0.95, -0.5),
      colors: [
        AppColors.metallicBlack,
        AppColors.metallicBlack.withOpacity(0.6),
        AppColors.metallicBlack.withOpacity(0.5),
        AppColors.metallicBlack.withOpacity(0.4),
        AppColors.metallicBlack.withOpacity(0.3),
        AppColors.metallicBlack.withOpacity(0.2),
        AppColors.metallicBlack.withOpacity(0.1),
        AppColors.metallicBlack.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get metallicRightToLeft {
    return LinearGradient(
      begin: Alignment(1.0, 0.5),
      end: Alignment(0.95, 0.5),
      colors: [
        AppColors.metallicBlack,
        AppColors.metallicBlack.withOpacity(0.6),
        AppColors.metallicBlack.withOpacity(0.5),
        AppColors.metallicBlack.withOpacity(0.4),
        AppColors.metallicBlack.withOpacity(0.3),
        AppColors.metallicBlack.withOpacity(0.2),
        AppColors.metallicBlack.withOpacity(0.1),
      ],
    );
  }

  static LinearGradient get metallicTopToBottom {
    return LinearGradient(
      begin: Alignment(0.0, -1.0),
      end: Alignment(0.0, -0.7),
      colors: [
        AppColors.metallicBlack,
        AppColors.metallicBlack.withOpacity(0.6),
        AppColors.metallicBlack.withOpacity(0.5),
        AppColors.metallicBlack.withOpacity(0.4),
        AppColors.metallicBlack.withOpacity(0.3),
        AppColors.metallicBlack.withOpacity(0.2),
        AppColors.metallicBlack.withOpacity(0.1),
      ],
    );
  }

  static LinearGradient get metallicBottomToTop {
    return LinearGradient(
      begin: Alignment(0.0, 1.0),
      end: Alignment(0.0, 0.7),
      colors: [
        AppColors.metallicBlack,
        AppColors.metallicBlack.withOpacity(0.6),
        AppColors.metallicBlack.withOpacity(0.5),
        AppColors.metallicBlack.withOpacity(0.4),
        AppColors.metallicBlack.withOpacity(0.3),
        AppColors.metallicBlack.withOpacity(0.2),
        AppColors.metallicBlack.withOpacity(0.1),
      ],
    );
  }
}
