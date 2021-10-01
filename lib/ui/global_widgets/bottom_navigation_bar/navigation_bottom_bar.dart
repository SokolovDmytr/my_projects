import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/bottom_navigation_bar_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/global_widgets/bottom_navigation_bar/navigation_bottom_bar_vm.dart';

import 'file:///C:/max/yellow_team_fridge/lib/services/route_service/app_routes.dart';

class CustomNavigationBottomBar extends StatelessWidget {
  final String currentPage;

  CustomNavigationBottomBar({
    this.currentPage,
  }) : super(key: Key('CustomNavigationBottomBar'));

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarLanguage _language = FlutterDictionary.instance.language?.bottomNavigationBarLanguage ?? en.bottomNavigationBarLanguage;
    return StoreConnector<AppState, NavigationBottomBarViewModel>(
      converter: NavigationBottomBarViewModel.init,
      builder: (BuildContext context, NavigationBottomBarViewModel vm) => SizedBox(
        height: 88.0,
        child: Column(
          children: [
            Divider(
              height: 1.0,
              color: AppColors.black.withOpacity(0.2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getBottomBarElement(
                    image: ImageAssets.bottomBarHome,
                    text: _language.home,
                    isHome: true,
                    function: vm.goToHomePage,
                    page: AppRoutes.homePage,
                    currentPage: currentPage,
                  ),
                  _getBottomBarElement(
                    image: ImageAssets.bottomBarFavourites,
                    text: _language.favourites,
                    isHome: false,
                    function: vm.goToFavouritesPage,
                    page: AppRoutes.favorites,
                    currentPage: currentPage,
                  ),
                  _getBottomBarElement(
                    image: ImageAssets.bottomBarSettings,
                    text: _language.settings,
                    isHome: false,
                    function: vm.goToSettingsPage,
                    page: AppRoutes.settings,
                    currentPage: currentPage,
                  ),
                ],
              ),
            ),
          ],
        ),
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
    @required String image,
    @required String text,
    @required bool isHome,
    @required String page,
    @required String currentPage,
    @required Function function,
  }) {
    final Color color = isHome ? AppColors.black.withOpacity(0.2) : AppColors.black;
    return InkWell(
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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: page == currentPage
                ? Text(
              text,
              style: AppFonts.smallTextStyleWheatMarigoldGradient,
            )
                : Text(
              text,
              style: AppFonts.smallTextStyleOpacity,
            ),
          ),
        ],
      ),
    );
  }
}
