import 'package:flutter/material.dart';

class RegisterAction {
  final String email;
  final String firstName;
  final String password;

  RegisterAction({
    @required this.email,
    @required this.password,
    @required this.firstName,
  });
}
