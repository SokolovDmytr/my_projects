import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_textfield.dart';
import 'package:yellow_team_fridge/ui/layouts/pages_layout/pages_layout.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/main_page_view_model.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/widgets/clip_shadow_painter.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/widgets/overlay_container_clipper.dart';

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
                      needSuffix: true,
                      needLoader: true,
                      needPrefix: true,
                      needShowButton: false,
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
                        : ListView.builder(
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
    final RenderBox renderBox = _textFieldContext.findRenderObject();
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

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
            final double containerHeight = vm.tempIngredients.length > 3 ? 195.0 : baseHeightOfIngredientElement * vm.tempIngredients.length * 1.25;
            final OverlayContainerClipper clipper = OverlayContainerClipper(
              borderRadius: 8.0,
              triangleHeight: 15.0,
              triangleWidth: 8.0,
            );

            return vm.tempIngredients.isEmpty
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
                            itemCount: vm.tempIngredients.length,
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
                                        child: vm.tempIngredients[index].image == null
                                            ? Image.asset(ImageAssets.chefYellow)
                                            : Image.network(
                                                vm.tempIngredients[index].image,
                                              ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          vm.tempIngredients[index].name ?? 'Not name',
                                          style: AppFonts.mediumBlack70TextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  vm.addIngredient(
                                    vm.tempIngredients[index],
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
