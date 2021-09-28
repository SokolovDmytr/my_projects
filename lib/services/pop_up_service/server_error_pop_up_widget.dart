import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class ServerErrorPopUpWidget extends StatelessWidget {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  ServerErrorPopUpWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 74.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 133.0,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 11.0),
              alignment: Alignment.center,
              child: Text(
                language.serverErrorText,
                maxLines: 2,
                softWrap: true,
                style: AppFonts.medium16Height24TextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Icon(Icons.error, color: AppColors.pastelRed, size: 33.0,),
            ),
          ],
        ),
      ),
    );
  }
}
