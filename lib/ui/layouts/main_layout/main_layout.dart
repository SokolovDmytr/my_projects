import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/custom_app_bar.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/navigation_bottom_bar.dart';

class MainLayout extends StatelessWidget {
  final AppBarType appBarType;
  final Widget body;
  final String? title;
  final String? currentPage;
  final Color? color;
  final LinearGradient? gradient;
  final bool? isMainStyleAppBar;
  final void Function()? onTapBack;
  final bool? needPaddings;

  MainLayout({
    required this.appBarType,
    required this.body,
    this.currentPage,
    this.title,
    this.color,
    this.gradient,
    this.isMainStyleAppBar,
    this.onTapBack,
    this.needPaddings = true,
    Key? key,
  }) : super(key: key);

  final SettingsPageLanguage _language = FlutterDictionary.instance.language.settingsPageLanguage;

  @override
  Widget build(BuildContext context) {
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

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          if (!isMainStyleAppBar!) {
            return false;
          } else {
            RouteSelectors.doPop().call();
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            preferredSize: size,
            isMainStyleAppBar: isMainStyleAppBar!,
            color: color,
            title: title,
            gradient: gradient,
            textButton: _language.back,
            key: key,
            onTapBack: onTapBack,
          ),
          bottomNavigationBar: CustomNavigationBottomBar(
            currentPage: currentPage ?? emptyString,
          ),
          body: Padding(
            padding: needPaddings! ? const EdgeInsets.symmetric(horizontal: 15.0) : const EdgeInsets.symmetric(),
            child: body,
          ),
        ),
      ),
    );
  }
}
