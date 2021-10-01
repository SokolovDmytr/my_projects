import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Placeholder(
                  fallbackHeight: 50.0,
                ),
                Text('Sign Up'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
