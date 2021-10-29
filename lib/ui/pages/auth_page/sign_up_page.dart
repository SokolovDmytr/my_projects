import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_textfield.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_cubit.dart';
import 'package:provider/src/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  Color emailColor = AppColors.transparent;
  Color passwordColor = AppColors.transparent;

  @override
  void initState() {
    emailController.addListener(() {});
    passwordController.addListener(() {});
    confirmPasswordController.addListener(() {});
    emailFocus.addListener(() {});
    passwordFocus.addListener(() {});
    confirmPasswordFocus.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationPageLanguage _language = FlutterDictionary.instance.language?.authenticationPageLanguage ?? en.authenticationPageLanguage;
    return Column(
      children: [
        Text(
          _language.signUp,
          style: AppFonts.normalBlackTwoTextStyle,
        ),
        GlobalTextField(
          key: UniqueKey(),
          showInPut: true,
          padding: const EdgeInsets.only(top: 20.0),
          hintText: _language.textFieldEmail,
          hintStyle: AppFonts.size16RegPinkishGrey,
          needSuffix: false,
          needPrefix: false,
          needShowButton: false,
          controller: emailController,
          focusNode: emailFocus,
          errorColor: emailColor,
          onSubmitted: (_) {
            if (passwordController.text.isEmpty) {
              FocusScope.of(context).requestFocus(passwordFocus);
            } else if (confirmPasswordController.text.isEmpty) {
              FocusScope.of(context).requestFocus(confirmPasswordFocus);
            }
          },
        ),
        GlobalTextField(
          key: UniqueKey(),
          showInPut: false,
          padding: const EdgeInsets.only(top: 16.0),
          hintText: _language.textFieldPassword,
          hintStyle: AppFonts.size16RegPinkishGrey,
          needSuffix: true,
          needPrefix: false,
          needShowButton: true,
          controller: passwordController,
          focusNode: passwordFocus,
          errorColor: passwordColor,
          onSubmitted: (_) {
            if (confirmPasswordController.text.isEmpty) {
              FocusScope.of(context).requestFocus(confirmPasswordFocus);
            } else if (emailController.text.isEmpty) {
              FocusScope.of(context).requestFocus(emailFocus);
            }
          },
        ),
        GlobalTextField(
          key: UniqueKey(),
          showInPut: false,
          padding: const EdgeInsets.only(top: 16.0),
          hintText: _language.textFieldConfirmPassword,
          hintStyle: AppFonts.size16RegPinkishGrey,
          needSuffix: true,
          needPrefix: false,
          needShowButton: true,
          controller: confirmPasswordController,
          focusNode: confirmPasswordFocus,
          errorColor: passwordColor,
          onSubmitted: (_) {
            if (emailController.text.isEmpty) {
              FocusScope.of(context).requestFocus(emailFocus);
            } else if (passwordController.text.isEmpty) {
              FocusScope.of(context).requestFocus(passwordFocus);
            }
          },
        ),
        Container(
          padding: const EdgeInsets.only(top: 29.0),
          child: GlobalButton(
            icon: Image.asset(ImageAssets.googleLogo),
            key: UniqueKey(),
            text: _language.registerGoogle,
            fontText: AppFonts.medium16blackTwoTextStyle,
            shadows: AppShadows.textFieldShadow,
            height: 42.0,
            onTap: () {
              /*
                add google register
                 */
            },
            innerPadding: const EdgeInsets.symmetric(horizontal: 60.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16),
          child: GlobalButton(
            height: 42.0,
            icon: Image.asset(ImageAssets.appleLogo),
            key: UniqueKey(),
            text: _language.registerApple,
            fontText: AppFonts.medium16blackTwoTextStyle,
            shadows: AppShadows.textFieldShadow,
            onTap: () {},
            innerPadding: const EdgeInsets.symmetric(horizontal: 60.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 30.0),
          child: GlobalButton(
            height: 56.0,
            key: UniqueKey(),
            text: _language.signUp,
            fontText: AppFonts.normalMediumTextStyle,
            onTap: () {
              final bool emailValid = RegExp(patternForEmail).hasMatch(emailController.text);
              if (emailValid && passwordController.text.isNotEmpty && confirmPasswordController.text == passwordController.text) {
                context.read<AuthPageCubit>().register(emailController.text, emailController.text, passwordController.text);
              } else {
                if (passwordController.text != confirmPasswordController.text ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  passwordColor = AppColors.red;
                }
                if (emailValid && emailController.text.isNotEmpty) {
                  setState(() {
                    emailColor = AppColors.transparent;
                  });
                } else {
                  setState(() {
                    emailColor = AppColors.red;
                  });
                }
              }
            },
            shadows: AppShadows.buttonOcreShadow,
            gradient: AppGradient.wheatMarigoldGradient,
          ),
        ),
      ],
    );
  }
}
