import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/bottom_navigation_bar_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';

class CustomNavigationBottomBar extends StatelessWidget {
  final String currentPage;

  CustomNavigationBottomBar({
    required this.currentPage,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarLanguage _language = FlutterDictionary.instance.language?.bottomNavigationBarLanguage ?? en.bottomNavigationBarLanguage;
    return SizedBox(
      height: 65.0,
      child: Column(
        children: [
          Divider(
            height: 1.0,
            color: AppColors.black.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _getBottomBarElement(
                  image: ImageAssets.bottomBarHome,
                  text: _language.home,
                  isHome: true,
                  function: RouteSelectors.goToHomePage(),
                  page: AppRoutes.homePage,
                  currentPage: currentPage,
                ),
                _getBottomBarElement(
                  image: ImageAssets.bottomBarFavourites,
                  text: _language.favourites,
                  isHome: false,
                  function: RouteSelectors.goToFavoritesPage(),
                  page: AppRoutes.favorites,
                  currentPage: currentPage,
                ),
                _getBottomBarElement(
                  image: ImageAssets.bottomBarSettings,
                  text: _language.settings,
                  isHome: false,
                  function: RouteSelectors.goToSettingsPage(),
                  page: AppRoutes.settings,
                  currentPage: currentPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createListWidget(
    String image,
    Color color,
  ) {
    final List<Widget> shaders = [];
    for (int i = 0; i < 8; i++) {
      shaders.add(
        ShaderMask(
          shaderCallback: (rect) {
            return AppGradient.wheatMarigoldGradient.createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: Image.asset(
            image,
            color: color,
            height: 30.0,
            width: 25.0,
          ),
        ),
      );
    }
    return shaders;
  }

  Widget _getBottomBarElement({
    required String image,
    required String text,
    required bool isHome,
    required String page,
    required String currentPage,
    required void Function() function,
  }) {
    final Color color = isHome ? AppColors.black.withOpacity(0.2) : AppColors.black;
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: function,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          page == currentPage
              ? Stack(
                  children: _createListWidget(image, color),
                )
              : Image.asset(
                  image,
                  color: color,
                  height: 30.0,
                  width: 25.0,
                ),
          Container(
            width: 70.0,
            padding: const EdgeInsets.all(4.0),
            child: page == currentPage
                ? Align(
                    child: Text(
                      text,
                      style: AppFonts.smallTextStyleWheatMarigoldGradient,
                    ),
                  )
                : Align(
                    child: Text(
                      text,
                      style: AppFonts.smallTextStyleOpacity,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
