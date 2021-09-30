import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
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
  FocusNode _textFieldFocusNode;
  OverlayEntry _overlayEntry;
  BuildContext _textFieldContext;

  @override
  void initState() {
    super.initState();

    _textFieldFocusNode = FocusNode();
    _textFieldFocusNode.addListener(() {
      if (_textFieldFocusNode.hasFocus) {
        _overlayEntry = _createOverlayList();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
        },
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
                child: Builder(
                  builder: (BuildContext ctx) {
                    _textFieldContext = ctx;
                    return TextFormField(
                      focusNode: _textFieldFocusNode,
                      onChanged: (String text) {
                        if (text.trim().length > 2) {
                          print('change: |${text}|');

                          StoreProvider.of<AppState>(context).dispatch(
                            GetIngredientsWithStringAction(name: text),
                          );
                        }
                      },
                    );
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
      ),
    );
  }

  OverlayEntry _createOverlayList() {
    RenderBox renderBox = _textFieldContext.findRenderObject();
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: StoreConnector<AppState, MainPageViewModel>(
          converter: MainPageViewModel.init,
          builder: (
            BuildContext _,
            MainPageViewModel vm,
          ) {
            final double containerHeight = vm.tempIngredients.length > 3 ? 195.0 : 65.0 * vm.tempIngredients.length;
            return Material(
              type: MaterialType.card,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: containerHeight,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: AppShadows.blurShadow(),
                ),
                child: ListView.separated(
                  itemCount: vm.tempIngredients.length,
                  separatorBuilder: (BuildContext _, int index) {
                    return Divider(
                      color: AppColors.black.withOpacity(0.5),
                      height: 0.5,
                    );
                  },
                  itemBuilder: (BuildContext _, int index) {
                    return InkWell(
                      child: ListTile(
                        leading: vm.tempIngredients[index].image == null
                            ? Image.asset(ImageAssets.chefYellow)
                            : Image.network(
                                vm.tempIngredients[index].image,
                              ),
                        title: Text(
                          vm.tempIngredients[index].name ?? 'Not name',
                          style: AppFonts.mediumShadowBlackTextStyle,
                        ),
                      ),
                      onTap: (){
                        vm.addIngredient(
                          vm.tempIngredients[index],
                        );
                      }
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
