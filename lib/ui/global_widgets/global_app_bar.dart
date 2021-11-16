import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const GlobalAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.transparent,
      ),
    );

    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: AppFonts.appBarStyle,
          ),
        ),
      ),
    );
  }
}
