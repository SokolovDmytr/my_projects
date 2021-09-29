import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class QuitAppDialogWidget extends StatelessWidget {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  QuitAppDialogWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 273.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: FlutterDictionary.instance.isRTL ? Alignment.topLeft : Alignment.topRight,
              margin: const EdgeInsets.only(
                top: 18.0,
                right: 18.0,
                left: 18.0,
              ),
              child: InkWell(
                child: Icon(
                  Icons.clear,
                  color: AppColors.pastelRed,
                  size: 24.0,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 42.0,
                  right: 42.0,
                  bottom: 30.0,
                ),
                alignment: Alignment.center,
                child: RichText(
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: language.logOutPopUpTitle,
                        style: AppFonts.normalBlackTwoTextStyle,
                      ),
                      TextSpan(
                        text: language.logOutPopUpAppName,
                        style: AppFonts.normalMariGoldTextStyle,
                      ),
                      TextSpan(
                        text: questionMark,
                        style: AppFonts.normalBlackTwoTextStyle,
                      ),
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(
                37.0,
                0.0,
                37.0,
                50.0,
              ),
              child: Row(
                textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalButton(
                    key: Key('no'),
                    width: 127.0,
                    height: 56.0,
                    text: language.logOutPopUpButtonNoText,
                    fontText: AppFonts.normalMediumTextStyle,
                    onTap: () {},
                    gradient: AppGradient.wheatMarigoldGradient,
                  ),
                  GlobalButton(
                    key: Key('yes'),
                    width: 127.0,
                    height: 56.0,
                    text: language.logOutPopUpButtonYesText,
                    fontText: AppFonts.normalMediumMariGoldTextStyle,
                    onTap: () {},
                    borderGradient: AppGradient.wheatMarigoldGradient,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
