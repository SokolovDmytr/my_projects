import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class LogOutPopUpWidget extends StatelessWidget {
  const LogOutPopUpWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsPageLanguage _language =
        FlutterDictionary.instance.language?.settingsPageLanguage ??
            en.settingsPageLanguage;
    return Dialog(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 273.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: _language.youSureWantToExit,
                    style: AppFonts.normalBlackTwoTextStyle,
                  ),
                  TextSpan(
                    text: ' Empty Fridge ',
                    style: AppFonts.normalMariGoldTextStyle,
                  ),
                  TextSpan(
                    text: '?',
                    style: AppFonts.normalBlackTwoTextStyle,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalButton(
                  key: Key('LogOutNo'),
                  text: _language.buttonNo,
                  fontText: AppFonts.normalMediumTextStyle,
                  onTap: () => Navigator.of(context).pop(),
                  height: 56.0,
                  width: 127.0,
                  gradient: AppGradient.wheatMarigoldGradient,
                ),
                GlobalButton(
                  key: Key('LogOutYes'),
                  text: _language.buttonYes,
                  fontText: AppFonts.normalMediumMariGoldTextStyle,
                  onTap: () {},
                  height: 56.0,
                  width: 127.0,
                  borderGradient: AppGradient.wheatMarigoldGradient,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
