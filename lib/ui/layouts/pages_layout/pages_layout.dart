import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/ui/global_widgets/bottom_navigation_bar/navigation_bottom_bar.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';

class MainLayout extends StatelessWidget {
  final AppBarType appBarType;
  final Widget body;
  final String title;
  final String currentPage;
  final Color color;
  final LinearGradient gradient;
  final bool isMainStyleAppBar;
  final Function onTapBack;

  const MainLayout({
    @required this.appBarType,
    @required this.body,
    this.currentPage,
    this.title,
    this.color,
    this.gradient,
    this.isMainStyleAppBar,
    this.onTapBack,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsPageLanguage _language =
        FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;
    Size size;
    switch (appBarType) {
      case AppBarType.home:
        size = Size.fromHeight(137.0);
        break;
      case AppBarType.simple:
        size = Size.fromHeight(88.0);
        break;
      case AppBarType.screenRecipe:
        size = Size.fromHeight(0.0);
        break;
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        preferredSize: size,
        isMainStyleAppBar: isMainStyleAppBar,
        color: color,
        title: title,
        gradient: gradient,
        textButton: _language.back,
        key: key,
        onTapBack: onTapBack,
      ),
      bottomNavigationBar: CustomNavigationBottomBar(
        currentPage: currentPage,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: body,
      ),
    );
  }
}
