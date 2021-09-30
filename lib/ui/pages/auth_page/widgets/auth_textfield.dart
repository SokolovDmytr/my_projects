import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({Key key}) : super(key: key);

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: AppFonts.size16RegPinkishGrey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
