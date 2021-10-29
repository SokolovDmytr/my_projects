import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_state.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/sign_in_page.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/sign_up_page.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/widgets/custom_switch.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool currentPage = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthPageCubit(),
      child: BlocBuilder<AuthPageCubit, AuthPageState>(
        builder: (context, state) => AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.white,
          ),
          child: WillPopScope(
            onWillPop: () async => false,
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 88.0, bottom: 26.0),
                          child: CustomSwitch(
                            key: UniqueKey(),
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
        ),
      ),
    );
  }
}
