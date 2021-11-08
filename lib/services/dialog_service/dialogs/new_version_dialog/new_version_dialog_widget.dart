import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';

class NewVersionDialogWidget extends StatelessWidget {
  final Function onTapOk;
  final String title;
  final String body;
  final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

  NewVersionDialogWidget({
    required this.onTapOk,
    required this.title,
    required this.body,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
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
                onTap: () {
                  onTapOk.call();
                  DialogService.instance.close();
                },
                child: Icon(
                  Icons.clear,
                  color: AppColors.pastelRed,
                  size: 24.0,
                ),
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
                      text: title,
                      style: AppFonts.normalBlackTwoTextStyle,
                    ),
                    WidgetSpan(
                      child: Icon(
                        const IconData(0x1F680, fontFamily: 'MaterialIcons'),
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
                body,
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
                key: UniqueKey(),
                width: 312.0,
                height: 56.0,
                text: language.loginPopUpButtonText,
                fontText: AppFonts.normalMediumTextStyle,
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
