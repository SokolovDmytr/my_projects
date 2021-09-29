import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class DescriptionBlock extends StatelessWidget {
  DescriptionBlock() : super(key: Key('DescriptionBlock'));

  @override
  Widget build(BuildContext context) {
    final SettingsPageLanguage _language =
        FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _language.aboutCompany,
          style: AppFonts.mediumTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100.0,
            vertical: 10.0,
          ),
          child: Image.asset(ImageAssets.appVestoLogo),
        ),
        Text(
          _language.description,
          style: AppFonts.medium16Height24TextStyle,
        ),
      ],
    );
  }
}
