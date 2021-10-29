import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/cubit/home_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/view/home_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext _) => HomePageCubit(),
      child: HomePageView(),
    );
  }
}
