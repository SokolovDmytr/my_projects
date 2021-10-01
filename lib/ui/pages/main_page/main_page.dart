import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/main_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/home_page_selector.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_textfield.dart';
import 'package:yellow_team_fridge/ui/layouts/pages_layout/pages_layout.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/main_page_view_model.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/widgets/clip_shadow_painter.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/widgets/overlay_container_clipper.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/widgets/swipe_element.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FocusNode _textFieldFocusNode;
  OverlayEntry _overlayEntry;
  BuildContext _textFieldContext;
  TextEditingController _textEditingController;
  String _textFromTextField;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {});
    _textFieldFocusNode = FocusNode();
    _textFieldFocusNode.addListener(() {
      if (_textFieldFocusNode.hasFocus) {
        _overlayEntry = _createOverlayList();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        print('no focus');
        HomePageSelector.clearTempIngredientList(
          store: StoreProvider.of<AppState>(context),
        );
        _overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final MainPageLanguage language = FlutterDictionary.instance.language?.mainPageLanguage ?? en.mainPageLanguage;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
        },
        child: MainLayout(
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
                    return GlobalTextField(
                      controller: _textEditingController,
                      focusNode: _textFieldFocusNode,
                      needSuffix: true,
                      needLoader: true,
                      needPrefix: true,
                      needShowButton: false,
                      onChanged: (String text) {
                        if (text.trim().isNotEmpty) {
                          HomePageSelector.getIngredientsWithName(
                            store: StoreProvider.of<AppState>(context),
                            name: text.trim(),
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
                    return vm.ingredients.isEmpty
                        ? Container(
                            margin: const EdgeInsets.fromLTRB(52.0, 30.0, 52.0, 80.0),
                            child: Image.asset(ImageAssets.favoriteChefArrow),
                          )
                        : ListView.separated(
                            itemCount: vm.ingredients.length,
                            separatorBuilder: (BuildContext _, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 1.0),
                                child: Divider(
                                  color: AppColors.black.withOpacity(0.5),
                                  height: 0.5,
                                ),
                              );
                            },
                            itemBuilder: (BuildContext __, int index) {
                              return SwipeElement(
                                background: Container(
                                  height: baseHeightOfIngredientElement,
                                  color: AppColors.pastelRed,
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: GlobalButton(
                                    key: Key('GlobalButtonDelete'),
                                    width: 70.0,
                                    height: 35.0,
                                    text: language.buttonDelete,
                                    fontText: AppFonts.medium16Height24WhiteTextStyle,
                                    onTap: (){
                                      setState(() {
                                        vm.deleteIngredient(vm.ingredients[index].i);
                                      });
                                    },
                                  )
                                ),
                                child: SizedBox(
                                  height: baseHeightOfIngredientElement,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                          22.0,
                                          5.0,
                                          4.0,
                                          5.0,
                                        ),
                                        child: vm.ingredients[index].image == null
                                            ? Image.asset(ImageAssets.chefYellow)
                                            : Image.network(
                                                vm.ingredients[index].image,
                                              ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          vm.ingredients[index].name ?? 'Not name',
                                          style: AppFonts.mediumBlack70ShadowTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
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
    print('++');
    final RenderBox renderBox = _textFieldContext.findRenderObject();
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Builder(
          builder: (
            BuildContext ctx,
          ) {
            final List<Ingredient> tempIngredients = StoreProvider.of<AppState>(ctx, listen: true).state.homePageState.tempIngredients;
            final double containerHeight = tempIngredients.length > 3 ? 195.0 : baseHeightOfIngredientElement * tempIngredients.length * 1.25;
            final OverlayContainerClipper clipper = OverlayContainerClipper(
              borderRadius: 8.0,
              triangleHeight: 15.0,
              triangleWidth: 8.0,
            );

            return tempIngredients.isEmpty
                ? const SizedBox()
                : CustomPaint(
                    painter: ClipShadowShadowPainter(
                      clipper: clipper,
                      shadow: AppShadows.blurShadow,
                    ),
                    child: ClipPath(
                      clipper: clipper,
                      child: Material(
                        child: SizedBox(
                          height: containerHeight,
                          child: ListView.separated(
                            itemCount: tempIngredients.length,
                            separatorBuilder: (BuildContext _, int index) {
                              return Divider(
                                color: AppColors.black.withOpacity(0.5),
                                height: 0.5,
                              );
                            },
                            itemBuilder: (BuildContext _, int index) {
                              return InkWell(
                                child: SizedBox(
                                  height: baseHeightOfIngredientElement,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                          22.0,
                                          5.0,
                                          4.0,
                                          5.0,
                                        ),
                                        child: tempIngredients[index].image == null
                                            ? Image.asset(ImageAssets.chefYellow)
                                            : Image.network(
                                                tempIngredients[index].image,
                                              ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          tempIngredients[index].name ?? 'Not name',
                                          style: AppFonts.mediumBlack70TextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  HomePageSelector.addIngredient(
                                    store: StoreProvider.of<AppState>(context),
                                    ingredient: tempIngredients[index],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
