import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/forgot_password_dialog/enter_email_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/forgot_password_dialog/forgot_password_dialog.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_textfield.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_cubit.dart';
import 'package:provider/src/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthenticationPageLanguage _language = FlutterDictionary.instance.language.authenticationPageLanguage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  Color emailColor = AppColors.transparent;
  Color passwordColor = AppColors.transparent;

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
    return Column(
      children: [
        Text(
          _language.signIn,
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
          isPasswordTextField: false,
          controller: emailController,
          focusNode: emailFocus,
          errorColor: emailColor,
          onSubmitted: (_) {
            if (passwordController.text.isEmpty) {
              FocusScope.of(context).requestFocus(passwordFocus);
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
          isPasswordTextField: true,
          controller: passwordController,
          focusNode: passwordFocus,
          errorColor: passwordColor,
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
            key: UniqueKey(),
            text: _language.signInGoogle,
            fontText: AppFonts.medium16blackTwoTextStyle,
            shadows: AppShadows.textFieldShadow,
            height: 42.0,
            onTap: () {
              context.read<AuthPageCubit>().signInWithGoogle();
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
            text: _language.signInApple,
            fontText: AppFonts.medium16blackTwoTextStyle,
            shadows: AppShadows.textFieldShadow,
            onTap: () {},
            innerPadding: const EdgeInsets.symmetric(horizontal: 60.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 30.0),
          child: GlobalButton(
            key: UniqueKey(),
            height: 56.0,
            text: _language.logIn,
            fontText: AppFonts.normalMediumTextStyle,
            onTap: () {
              final bool emailValid = RegExp(patternForEmail).hasMatch(emailController.text);
              if (emailValid && passwordController.text.isNotEmpty) {
                context.read<AuthPageCubit>().logIn(emailController.text, passwordController.text);
              } else {
                if (passwordController.text.isEmpty) {
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
        Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: GlobalButton(
            height: 19.0,
            width: 178.0,
            key: UniqueKey(),
            text: _language.buttonForgotPassword,
            fontText: AppFonts.size16SemiBoldMarigold,
            onTap: () {
              DialogService.instance.show(
                dialog: ForgotPasswordDialog(
                  child: EnterEmailDialogWidget(
                    onTapSend: (String? email) {
                      if (email != null) {
                        context.read<AuthPageCubit>().sendEmail(email: email);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
