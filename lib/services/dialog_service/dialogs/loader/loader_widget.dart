import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class LoaderWidget extends StatelessWidget {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  LoaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      child: SizedBox(
        height: 85.0,
        child: Column(
          children: [
            Image.asset(
              ImageAssets.loadingGif,
              height: 45.0,
              width: 45.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                language.loadingText,
                style: AppFonts.medium16Height24WhiteTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
