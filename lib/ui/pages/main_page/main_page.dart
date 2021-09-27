import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        gradient: AppGradient.marigolWheatdGradient,
        title: 'Notification',
        textButton: 'Back',
        isMainStyleAppBar: true,
        preferredSize: Size.fromHeight(88.0),
        key: UniqueKey(),
      ),
      body: Center(
        child: GlobalButton(
          onTap: () {
            RouteSelectors.pushNamed(
              store: StoreProvider.of<AppState>(context),
              route: AppRoutes.auth,
            );
          },
          gradient: AppGradient.wheatMarigoldGradient,
          key: Key('123'),
          width: 312.0,
          height: 56.0,
          text: 'Watch recipes',
          fontText: AppFonts.normalMediumTextStyle,
        ),
      ),
    );
  }
}
