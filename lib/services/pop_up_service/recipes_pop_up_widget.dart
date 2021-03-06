import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';

class RecipesPopUpWidget extends StatelessWidget {
  final String text;

  const RecipesPopUpWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 74.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 77.0,
        margin: const EdgeInsets.fromLTRB(23.0, 0.0, 23.0, 0.0),
        alignment: Alignment.center,
        child: Text(
          text,
          maxLines: 2,
          softWrap: true,
          style: AppFonts.medium16Height24TextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
