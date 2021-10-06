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

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    emailController.addListener(() {});
    passwordController.addListener(() {});
    emailFocus.addListener(() {});
    passwordFocus.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationPageLanguage _language =
        FlutterDictionary.instance.language?.authenticationPageLanguage ??
            en.authenticationPageLanguage;
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
            focusNode: emailFocus,
            onSubmitted: (_) {
              if (passwordController.text.isEmpty) {
                FocusScope.of(context).requestFocus(passwordFocus);
              }
            },
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
            focusNode: passwordFocus,
            onSubmitted: (_) {
              if (emailController.text.isEmpty) {
                FocusScope.of(context).requestFocus(emailFocus);
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 29.0),
            child: GlobalButton(
              icon: Image.asset(ImageAssets.googleLogo),
              key: Key('SignInGoogle'),
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
              key: Key('SignInApple'),
              text: _language.signInApple,
              fontText: AppFonts.medium16blackTwoTextStyle,
              shadows: AppShadows.textFieldShadow,
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 30.0),
            child: GlobalButton(
              key: Key('LogIn'),
              height: 56.0,
              text: _language.logIn,
              fontText: AppFonts.normalMediumTextStyle,
              onTap: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  vm.logIn(emailController.text, passwordController.text);
                }
              },
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
