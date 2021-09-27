import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_pop_action.dart';
import 'package:yellow_team_fridge/store/shared/route_state/actions/navigate_push_named_and_remove_until_action.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class UnknownPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Unknown Page',
              style: AppFonts.mediumTextStyle,
            ),
            GlobalButton(
              onTap: () {
                StoreProvider.of<AppState>(context).dispatch(
                  NavigatePopAction(),
                );
              },
              gradient: AppGradient.wheatMarigoldGradient,
              key: Key('123'),
              width: 312.0,
              height: 56.0,
              text: 'Watch recipes',
              fontText: AppFonts.normalMediumTextStyle,
            ),
            GlobalButton(
              onTap: () {
                StoreProvider.of<AppState>(context).dispatch(
                  NavigatePushNamedAndRemoveUntilAction(route: AppRoutes.home, routeNamePredicate: AppRoutes.home),
                );
              },
              gradient: AppGradient.wheatMarigoldGradient,
              key: Key('1234'),
              width: 312.0,
              height: 56.0,
              text: 'Watch recipes',
              fontText: AppFonts.normalMediumTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
