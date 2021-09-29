import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class SettingsLayoutOptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final String newKey;
  final Function onTap;

  SettingsLayoutOptionWidget({
    @required this.onTap,
    @required this.newKey,
    @required this.icon,
    @required this.title,
  }) : super(key: Key('$newKey'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppFonts.mediumTextStyle,
                ),
                 RotatedBox(
                   quarterTurns: FlutterDictionary.instance.isRTL ? 2 : 4,
                   child: InkWell(
                    onTap: onTap,
                    child: Icon(
                      icon,
                      color: AppColors.marigold,
                    ),
                ),
                 ),
              ],
            ),
          ),
          Divider(
            height: 0.5,
            color: AppColors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
