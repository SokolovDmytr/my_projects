import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';

class PopUpService {
  static const tag = '[PopUpService]';

  PopUpService._privateConstructor();

  static final PopUpService _instance = PopUpService._privateConstructor();

  static PopUpService get instance => _instance;

  void show({
    required Widget widget,
    required BuildContext ctx,
  }) {
    showDialog(
      context: ctx,
      barrierDismissible: true,
      barrierColor: AppColors.transparent,
      builder: (BuildContext _) => widget,
    );
  }
}
