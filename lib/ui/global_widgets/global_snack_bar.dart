import 'package:flutter/material.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';

class GlobalSnackBar extends StatefulWidget {
  final String text;

  const GlobalSnackBar({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _GlobalSnackBarState createState() => _GlobalSnackBarState();
}

class _GlobalSnackBarState extends State<GlobalSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(
        color: AppColors.metallicBlue,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          AppShadows.neonGreenSpread1Shadow,
        ],
      ),
      child: Align(
        child: Text(
          widget.text,
          style: AppFonts.robotoWhite18Bold,
        ),
      ),
    );
  }
}
