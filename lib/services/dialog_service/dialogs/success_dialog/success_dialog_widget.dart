import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';

class SuccessDialogWidget extends StatelessWidget {
  final String? text;
  final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

  SuccessDialogWidget({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
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
                '${language.defaultSuccessText}\n${text ?? emptyString}',
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
              child: GlobalButton(
                key: UniqueKey(),
                width: 127.0,
                height: 56.0,
                text: language.deletePopUpButtonOkText,
                fontText: AppFonts.normalMediumTextStyle,
                onTap: () => DialogService.instance.close(),
                gradient: AppGradient.wheatMarigoldGradient,
              ),
            )
          ],
        ),
      ),
    );
  }
}
