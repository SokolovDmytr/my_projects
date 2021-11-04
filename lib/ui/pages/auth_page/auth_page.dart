import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/repositories/auth_repository.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/auth_view.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_cubit.dart';

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
      create: (_) => AuthPageCubit(
        repository: AuthRepository.instance,
      ),
      child: AuthView(),
    );
  }
}
