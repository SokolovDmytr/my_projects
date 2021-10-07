import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/ui/pages/auth_page/sign_in_page.dart';
import 'package:yellow_team_fridge/ui/pages/auth_page/sign_up_page.dart';
import 'package:yellow_team_fridge/ui/pages/auth_page/widgets/custom_switch.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool currentPage = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 26.0),
                      child: CustomSwitch(
                        key: Key('Switch'),
                        onChanged: (bool value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        value: currentPage,
                      ),
                    ),
                    currentPage ? SignUpPage() : SignInPage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
