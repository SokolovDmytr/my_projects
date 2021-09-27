import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class DeleteDialogWidget extends StatelessWidget {
  final String text;
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  DeleteDialogWidget({
    @required this.text,
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
              margin: const EdgeInsets.fromLTRB(
                40.0,
                40.0,
                40.0,
                30.0,
              ),
              alignment: Alignment.center,
              child: Text(
                '${language.deletePopUpTitle} ${text}?',
                style: AppFonts.normalBlackTwoTextStyle,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(
                37.0,
                0.0,
                37.0,
                50.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalButton(
                    key: Key('cancel'),
                    width: 127.0,
                    height: 56.0,
                    text: language.deletePopUpButtonCancelText,
                    fontText: AppFonts.normalMediumTextStyle,
                    onTap: () {},
                    gradient: AppGradient.wheatMarigoldGradient,
                  ),
                  GlobalButton(
                    key: Key('ok'),
                    width: 127.0,
                    height: 56.0,
                    text: language.deletePopUpButtonOkText,
                    fontText: AppFonts.normalMediumMariGoldTextStyle,
                    onTap: () {},
                    borderColor: AppColors.wheat,
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
