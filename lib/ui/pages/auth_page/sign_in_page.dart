import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationPageLanguage _language =
        FlutterDictionary.instance.language?.authenticationPageLanguage ?? en.authenticationPageLanguage;
    return Column(
      children: [
        Text(
          _language.signIn,
          style: AppFonts.normalBlackTwoTextStyle,
        ),
        GlobalTextField(
          padding: const EdgeInsets.only(top: 20.0),
          hintText: _language.textFieldEmail,
          hintStyle: AppFonts.size16RegPinkishGrey,
          needSuffix: false,
          needLoader: false,
          needPrefix: false,
          needShowButton: false,
        ),
        GlobalTextField(
          padding: const EdgeInsets.only(top: 16.0),
          hintText: _language.textFieldPassword,
          hintStyle: AppFonts.size16RegPinkishGrey,
          needSuffix: true,
          needLoader: false,
          needPrefix: false,
          needShowButton: true,
        ),
        GlobalButton(
          icon: Image.asset(ImageAssets.googleLogo),
          padding: const EdgeInsets.only(top: 29.0),
          key: Key('RegisterGoogle'),
          text: _language.signInGoogle,
          fontText: AppFonts.medium16blackTwoTextStyle,
          shadows: AppShadows.textFieldShadow,
          height: 42.0,
          onTap: () {},
        ),
        GlobalButton(
          height: 42.0,
          icon: Image.asset(ImageAssets.appleLogo),
          padding: const EdgeInsets.only(top: 16),
          key: Key('RegisterApple'),
          text: _language.registerApple,
          fontText: AppFonts.medium16blackTwoTextStyle,
          shadows: AppShadows.textFieldShadow,
          onTap: () {},
        ),
        GlobalButton(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 30.0),
          key: Key('LogIn'),
          text: _language.logIn,
          fontText: AppFonts.normalMediumTextStyle,
          onTap: () {},
          shadows: AppShadows.buttonOcreShadow,
          gradient: AppGradient.wheatMarigoldGradient,
        ),
        GlobalButton(
          padding: const EdgeInsets.only(top: 16.0),
          height: 19.0,
          width: 178.0,
          key: Key('forgotPassword'),
          text: _language.buttonForgotPassword,
          fontText: AppFonts.size16SemiBoldMarigold,
          onTap: () {},
        ),
      ],
    );
  }
}
