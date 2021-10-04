import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_textfield.dart';
import 'package:yellow_team_fridge/ui/pages/auth_page/auth_page_vm.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthenticationPageLanguage _language = FlutterDictionary.instance.language?.authenticationPageLanguage ?? en.authenticationPageLanguage;
    return StoreConnector<AppState, AuthPageViewModel>(
      converter: AuthPageViewModel.init,
      builder: (BuildContext context, AuthPageViewModel vm) => Column(
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
            controller: emailController,
          ),
          GlobalTextField(
            padding: const EdgeInsets.only(top: 16.0),
            hintText: _language.textFieldPassword,
            hintStyle: AppFonts.size16RegPinkishGrey,
            needSuffix: true,
            needLoader: false,
            needPrefix: false,
            needShowButton: true,
            controller: passwordController,
          ),
          Container(
            padding: const EdgeInsets.only(top: 29.0),
            child: GlobalButton(
              icon: Image.asset(ImageAssets.googleLogo),
              key: Key('RegisterGoogle'),
              text: _language.signInGoogle,
              fontText: AppFonts.medium16blackTwoTextStyle,
              shadows: AppShadows.textFieldShadow,
              height: 42.0,
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: GlobalButton(
              height: 42.0,
              icon: Image.asset(ImageAssets.appleLogo),
              key: Key('RegisterApple'),
              text: _language.registerApple,
              fontText: AppFonts.medium16blackTwoTextStyle,
              shadows: AppShadows.textFieldShadow,
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 30.0),
            child: GlobalButton(
              key: Key('LogIn'),
              text: _language.logIn,
              fontText: AppFonts.normalMediumTextStyle,
              onTap: () => vm.logIn(emailController.text, passwordController.text),
              shadows: AppShadows.buttonOcreShadow,
              gradient: AppGradient.wheatMarigoldGradient,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: GlobalButton(
              height: 19.0,
              width: 178.0,
              key: Key('forgotPassword'),
              text: _language.buttonForgotPassword,
              fontText: AppFonts.size16SemiBoldMarigold,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
