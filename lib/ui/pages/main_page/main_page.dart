import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/loader/loader_state.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: AppColors.black,
        textButton: 'Back',
        isMainStyleAppBar: true,
        preferredSize: Size.fromHeight(88.0),
        key: UniqueKey(),
      ),
      body: GlobalButton(
        key: Key('global button'),
        gradient: AppGradient.wheatMarigoldGradient,
        onTap: () {
          LoaderPopUp(child: LoaderWidget(), loaderKey: LoaderKey.getData, state: true, title: 'Loader', ).show();
        },
        text: 'OK',
        fontText: AppFonts.normalMediumTextStyle,
      ),
    );
  }
}
