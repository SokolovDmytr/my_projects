import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';

class DescriptionBlock extends StatelessWidget {
  DescriptionBlock() : super(key: UniqueKey());
  final SettingsPageLanguage _language = FlutterDictionary.instance.language.settingsPageLanguage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _language.aboutCompany,
          style: AppFonts.mediumTextStyleBlackTwo,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Align(
            child: Image.asset(
              ImageAssets.appVestoLogo,
              width: 71.0,
              height: 71.0,
            ),
          ),
        ),
        Align(
          alignment: FlutterDictionary.instance.isRTL ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(
            _language.description,
            style: AppFonts.medium16Height24TextStyle,
          ),
        ),
      ],
    );
  }
}
