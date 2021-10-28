import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarType: AppBarType.home,
      gradient: AppGradient.marigoldWheatGradient,
      isMainStyleAppBar: false,
      currentPage: AppRoutes.homePage,
      key: UniqueKey(),      body: Container(),
    );
  }
}
