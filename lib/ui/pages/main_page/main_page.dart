import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_ingredients_with_string_action.dart';
import 'package:yellow_team_fridge/ui/layouts/pages_layout/pages_layout.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/main_page_view_model.dart';

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
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (String text) {
                  if (text.trim().length > 2) {
                    print('change: |${text}|');

                    StoreProvider.of<AppState>(context).dispatch(
                      GetIngredientsWithStringAction(name: text),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: StoreConnector<AppState, MainPageViewModel>(
                converter: MainPageViewModel.init,
                builder: (
                  BuildContext _,
                  MainPageViewModel vm,
                ) {
                  return ListView.builder(
                    itemCount: vm.ingredients.length,
                    itemBuilder: (BuildContext __, int index) {
                      return ListTile(
                        leading: vm.ingredients[index].image == null
                            ? Image.asset(ImageAssets.chefYellow)
                            : Image.network(
                                vm.ingredients[index].image,
                              ),
                        title: Text(
                          vm.ingredients[index].name ?? 'Not name',
                          style: AppFonts.mediumShadowBlackTextStyle,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
