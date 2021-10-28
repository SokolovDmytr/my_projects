import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_textfield.dart';

class EnterNewPasswordDialogWidget extends StatefulWidget {
  final Function(String) onTapSave;

  const EnterNewPasswordDialogWidget({
    required this.onTapSave,
    Key key,
  }) : super(key: key);

  @override
  _EnterNewPasswordDialogWidgetState createState() => _EnterNewPasswordDialogWidgetState();
}

class _EnterNewPasswordDialogWidgetState extends State<EnterNewPasswordDialogWidget> {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;
  final FocusNode _passwordTextFieldFocusNode = FocusNode();
  final FocusNode _confirmPasswordTextFieldFocusNode = FocusNode();
  String _password;
  String _confirmPassword;

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
                  DialogService.instance.close(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 19.0,
              ),
              alignment: Alignment.center,
              child: Text(
                language.forgotPasswordPasswordTitle,
                style: AppFonts.medium16Height24blackTwoRegularTextStyle,
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GlobalTextField(
              showInPut: false,
              focusNode: _passwordTextFieldFocusNode,
              needPrefix: false,
              needSuffix: false,
              hintText: language.forgotPasswordPasswordHint,
              hintStyle: AppFonts.medium16Height24pinkishGreyTextStyle,
              needShowButton: false,
              onChanged: (String text) => _password = text,
              onSubmitted: () {
                FocusScope.of(context).requestFocus(_confirmPasswordTextFieldFocusNode);
              },
            ),
            GlobalTextField(
              showInPut: true,
              focusNode: _confirmPasswordTextFieldFocusNode,
              needPrefix: false,
              needSuffix: false,
              hintText: language.forgotPasswordConfirmPasswordHint,
              hintStyle: AppFonts.medium16Height24pinkishGreyTextStyle,
              needShowButton: false,
              onChanged: (String text) => _confirmPassword = text,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 26.0,
                bottom: 50.0,
              ),
              child: GlobalButton(
                key: UniqueKey(),
                height: 56.0,
                text: language.forgotPasswordButtonSaveText,
                fontText: AppFonts.normalMediumTextStyle,
                gradient: AppGradient.wheatMarigoldGradient,
                shadows: AppShadows.buttonOcreShadow,
                onTap: () {
                  if (_password == _confirmPassword) {
                    widget.onTapSave.call(_password);
                  } else {
                    FocusScope.of(context).requestFocus(_passwordTextFieldFocusNode);
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
