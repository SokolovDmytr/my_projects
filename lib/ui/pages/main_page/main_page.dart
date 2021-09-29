import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';
import 'package:yellow_team_fridge/ui/pages/favorites_page/widgets/recipes_list.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: AppColors.wheat,
        textButton: 'Back',
        isMainStyleAppBar: true,
        preferredSize: Size.fromHeight(88.0),
        key: UniqueKey(),
      ),
      body: RecipesList(),
    );
  }
}
