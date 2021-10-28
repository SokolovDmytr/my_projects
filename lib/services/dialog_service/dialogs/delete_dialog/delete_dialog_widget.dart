import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';


class DeleteDialogWidget extends StatelessWidget {
  final String text;
  final Function onTapDelete;
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  DeleteDialogWidget({
    required this.text,
    required this.onTapDelete,
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
                borderRadius: BorderRadius.circular(10.0),
                child: Icon(
                  Icons.clear,
                  color: AppColors.pastelRed,
                  size: 24.0,
                ),
                onTap: () {
                  DialogService.instance.close(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                bottom: 30.0,
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
                textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalButton(
                    key: UniqueKey(),
                    width: 127.0,
                    height: 56.0,
                    text: language.deletePopUpButtonCancelText,
                    fontText: AppFonts.normalMediumTextStyle,
                    onTap: () {
                      DialogService.instance.close(context);
                    },
                    gradient: AppGradient.wheatMarigoldGradient,
                  ),
                  GlobalButton(
                    key: UniqueKey(),
                    width: 127.0,
                    height: 56.0,
                    text: language.deletePopUpButtonOkText,
                    fontText: AppFonts.normalMediumMariGoldTextStyle,
                    onTap: () {
                      onTapDelete.call();
                      DialogService.instance.close(context);
                    },
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
