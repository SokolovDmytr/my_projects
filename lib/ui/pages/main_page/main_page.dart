import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_textfield.dart';
import 'package:yellow_team_fridge/ui/layouts/pages_layout/pages_layout.dart';
import 'package:yellow_team_fridge/ui/pages/auth_page/auth_page.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: PagesLayout(
        appBarType: AppBarType.home,
        gradient: AppGradient.marigoldWheatGradient,
        isMainStyleAppBar: false,
        currentPage: AppRoutes.homePage,
        key: UniqueKey(),
        body: Column(
          children: [
            Container(
              child: GlobalTextField(
                hintText: 'Email',
                hintStyle: AppFonts.size16RegPinkishGrey,
                needLoader: true,
                needPrefix: true,
                needShowButton: false,
                needSuffix: true,
              ),
            ),
            GlobalButton(
              key: Key('temp'),
              text: 'a',
              fontText: AppFonts.smallTextStyleWheatMarigoldGradient,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AuthPage(),
              )),
            )
          ],
        ),
      ),
    );
  }
}
