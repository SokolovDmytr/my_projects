import 'package:flutter/material.dart';

class AuthenticationPageLanguage {
  final String welcome;
  final String registerGoogle;
  final String registerApple;
  final String enterEmail;
  final String textFieldEmail;
  final String buttonSend;
  final String signUp;
  final String signIn;
  final String signInGoogle;
  final String signInApple;
  final String textFieldPassword;
  final String textFieldConfirmPassword;
  final String buttonShow;
  final String newVersion;
  final String newVersionText;
  final String buttonOk;
  final String buttonForgotPassword;
  final String logIn;

  AuthenticationPageLanguage({
    @required this.welcome,
    @required this.registerGoogle,
    @required this.registerApple,
    @required this.enterEmail,
    @required this.textFieldEmail,
    @required this.buttonSend,
    @required this.signUp,
    @required this.signIn,
    @required this.signInApple,
    @required this.signInGoogle,
    @required this.textFieldPassword,
    @required this.textFieldConfirmPassword,
    @required this.buttonShow,
    @required this.newVersion,
    @required this.newVersionText,
    @required this.buttonOk,
    @required this.buttonForgotPassword,
    @required this.logIn,
  });

  factory AuthenticationPageLanguage.fromJson(Map<String, dynamic> json) {
    return AuthenticationPageLanguage(
      buttonOk: json['buttonOk'],
      buttonForgotPassword: json['buttonForgotPassword'],
      buttonSend: json['buttonSend'],
      buttonShow: json['buttonShow'],
      enterEmail: json['enterEmail'],
      logIn: json['logIn'],
      newVersion: json['newVersion'],
      newVersionText: json['newVersionText'],
      registerApple: json['registerApple'],
      registerGoogle: json['registerGoogle'],
      signIn: json['signIn'],
      signUp: json['signUp'],
      textFieldConfirmPassword: json['textFieldConfirmPassword'],
      textFieldEmail: json['textFieldEmail'],
      textFieldPassword: json['textFieldPassword'],
      welcome: json['welcome'],
      signInApple: json['signInApple'],
      signInGoogle: json['signInGoogle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buttonOk': buttonOk,
      'buttonForgotPassword': buttonForgotPassword,
      'buttonSend': buttonSend,
      'buttonShow': buttonShow,
      'enterEmail': enterEmail,
      'logIn': logIn,
      'newVersion': newVersion,
      'newVersionText': newVersionText,
      'registerApple': registerApple,
      'registerGoogle': registerGoogle,
      'signIn': signIn,
      'signUp': signUp,
      'textFieldConfirmPassword': textFieldConfirmPassword,
      'textFieldEmail': textFieldEmail,
      'textFieldPassword': textFieldPassword,
      'welcome': welcome,
      'signInApple':signInApple,
      'signInGoogle':signInGoogle,
    };
  }
}
