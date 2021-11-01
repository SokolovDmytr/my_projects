import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_textfield.dart';

class EnterEmailDialogWidget extends StatefulWidget {
  final Function(String) onTapSend;

  const EnterEmailDialogWidget({
    required this.onTapSend,
    Key? key,
  }) : super(key: key);

  @override
  _EnterEmailDialogWidgetState createState() => _EnterEmailDialogWidgetState();
}

class _EnterEmailDialogWidgetState extends State<EnterEmailDialogWidget> {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;
  Color? _emailColor;
  String _text = emptyString;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 260.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: FlutterDictionary.instance.isRTL ? Alignment.topLeft : Alignment.topRight,
              margin: const EdgeInsets.only(
                top: 18.0,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
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
              margin: const EdgeInsets.only(
                bottom: 17.0,
              ),
              alignment: Alignment.center,
              child: Text(
                language.forgotPasswordEmailTitle,
                style: AppFonts.medium16Height24blackTwoRegularTextStyle,
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GlobalTextField(
                showInPut: true,
                needPrefix: false,
                needSuffix: false,
                hintText: language.forgotPasswordEmailHint,
                hintStyle: AppFonts.medium16Height24pinkishGreyTextStyle,
                needShowButton: false,
                onChanged: (String text) => _text = text,
                errorColor: _emailColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 26.0,
                bottom: 50.0,
              ),
              child: GlobalButton(
                key: UniqueKey(),
                height: 56.0,
                text: language.forgotPasswordButtonSendText,
                fontText: AppFonts.normalMediumTextStyle,
                gradient: AppGradient.wheatMarigoldGradient,
                shadows: AppShadows.buttonOcreShadow,
                onTap: () {
                  final bool emailValid = RegExp(patternForEmail).hasMatch(_text);
                  if (emailValid) {
                    widget.onTapSend.call(_text);
                  } else {
                    setState(() {
                      _emailColor = AppColors.red;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
