import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialog_service.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class NewVersionDialogWidget extends StatelessWidget {
  final Function onTapOk;
  final DialogLanguage language =
      FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  NewVersionDialogWidget({
    @required this.onTapOk,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 340.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: FlutterDictionary.instance.isRTL
                  ? Alignment.topLeft
                  : Alignment.topRight,
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
                  DialogService.instance.close();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 50.0,
              ),
              alignment: Alignment.center,
              child: RichText(
                maxLines: 2,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: language.loginPopUpTitle,
                      style: AppFonts.normalBlackTwoTextStyle,
                    ),
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.rocket,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(
                42.0,
                15.0,
                42.0,
                21.0,
              ),
              child: Text(
                placeholder_text,
                textAlign: TextAlign.center,
                maxLines: 4,
                softWrap: true,
                style: AppFonts.medium16Height26TextStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 42.0,
              ),
              child: GlobalButton(
                key: Key('ok'),
                width: 312.0,
                height: 56.0,
                text: language.loginPopUpButtonText,
                fontText: AppFonts.normalMediumMariGoldTextStyle,
                gradient: AppGradient.wheatMarigoldGradient,
                shadows: AppShadows.buttonOcreShadow,
                onTap: () {
                  onTapOk.call();
                  DialogService.instance.close();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
