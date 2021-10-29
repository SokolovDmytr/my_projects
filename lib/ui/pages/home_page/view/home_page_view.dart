import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/main_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/cache_manager/image_cache_manager.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/text_field_loader/text_field_loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_textfield.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/cubit/home_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/cubit/home_page_state.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/widgets/clip_shadow_painter.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/widgets/overlay_container_clipper.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/widgets/swipe_element.dart';
import 'package:fridge_yellow_team_bloc/utils/function_delay.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final _functionDelay = FunctionDelay(
    duration: AppDuration.delayOfSendRequestToServer,
  );
  final TextFieldLoaderWidget _textFieldLoaderWidget = TextFieldLoaderWidget();
  late FocusNode _textFieldFocusNode;
  late OverlayEntry _overlayEntry;
  BuildContext? _textFieldContext;
  String _textFromSearchTextField = emptyString;

  @override
  void initState() {
    super.initState();
    super.initState();
    _textFieldFocusNode = FocusNode();
    _textFieldFocusNode.addListener(
      () {
        if (_textFieldFocusNode.hasFocus) {
          _overlayEntry = _createOverlayList();
          Overlay.of(context)!.insert(_overlayEntry);
        } else {
          _overlayEntry.remove();
/*
            if (UserInformationService.instance.isFirstSeeSwipeTutorial() == false &&
                StoreProvider.of<AppState>(context, listen: true).state.homePageState.ingredients.isNotEmpty) {
              DialogSelector.showSwipeTutorialDialogFunction(
                store: StoreProvider.of<AppState>(context),
                onTapOk: () {
                  UserInformationService.instance.seeSwipeTutorial();
                  DialogSelector.closeDialog(
                    store: StoreProvider.of<AppState>(context),
                  );
                },
              );*/
        }
      },
    );
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
          if (FocusManager.instance.primaryFocus != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
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
                margin: const EdgeInsets.only(top: 11.0),
                child: Builder(
                  builder: (BuildContext ctx) {
                    _textFieldContext = ctx;

                    //TODO make logic for loader
                    bool needLoader = true;

                    return GlobalTextField(
                      showInPut: true,
                      focusNode: _textFieldFocusNode,
                      needSuffix: true,
                      loader: _textFieldLoaderWidget,
                      needPrefix: true,
                      needShowButton: false,
                      hintText: language.chooseTextField,
                      hintStyle: AppFonts.medium16Height24TextStyle,
                      onChanged: (String text) {
                        _textFromSearchTextField = text.trim();
                        if (_textFromSearchTextField.isNotEmpty) {
                          _functionDelay.run(() {
                            ctx.read<HomePageCubit>().getIngredientsWithString(str: _textFromSearchTextField);
                          });
                        } else {
                          if (ctx.read<HomePageCubit>().state.tempIngredients.isNotEmpty) {
                            ctx.read<HomePageCubit>().clearTempIngredients();
                          }
                        }
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (
                    BuildContext blocBuilderContext,
                    HomePageState state,
                  ) {
                    final MainPageLanguage language = FlutterDictionary.instance.language?.mainPageLanguage ?? en.mainPageLanguage;
                    final double stackWidth = MediaQuery.of(blocBuilderContext).size.width;

                    return state.ingredients.isEmpty
                        ? Container(
                            margin: const EdgeInsets.fromLTRB(
                              52.0,
                              30.0,
                              52.0,
                              80.0,
                            ),
                            child: Image.asset(ImageAssets.favoriteChefArrow),
                          )
                        : Stack(
                            alignment: Alignment.topCenter,
                            fit: StackFit.passthrough,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 25.0, bottom: 4.0),
                                    alignment: FlutterDictionary.instance.isRTL ? Alignment.centerLeft : Alignment.centerRight,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Text(
                                        language.clearAll,
                                        style: AppFonts.smallPaselRedTextStyle,
                                      ),
                                      onTap: () => blocBuilderContext.read<HomePageCubit>().clearIngredients(),
                                    ),
                                  ),
                                  Flexible(
                                    child: ListView.separated(
                                      itemCount: state.ingredients.length + 1,
                                      separatorBuilder: (BuildContext _, int index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(vertical: 1.0),
                                          child: Divider(
                                            color: AppColors.black.withOpacity(0.5),
                                            height: 0.5,
                                          ),
                                        );
                                      },
                                      itemBuilder: (BuildContext _, int index) {
                                        return index == state.ingredients.length
                                            ? const SizedBox(
                                                height: 90.0,
                                              )
                                            : SwipeElement(
                                                key: UniqueKey(),
                                                background: Container(
                                                  height: baseHeightOfIngredientElement,
                                                  color: AppColors.pastelRed,
                                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                  alignment: FlutterDictionary.instance.isRTL ? Alignment.centerRight : Alignment.centerLeft,
                                                  child: GlobalButton(
                                                    key: UniqueKey(),
                                                    width: 70.0,
                                                    height: 45.0,
                                                    color: AppColors.pastelRed,
                                                    text: language.buttonDelete,
                                                    fontText: AppFonts.medium16Height24WhiteTextStyle,
                                                    onTap: () {
                                                      blocBuilderContext.read<HomePageCubit>().deleteIngredient(id: state.ingredients[index].i);
                                                    },
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  height: baseHeightOfIngredientElement,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 57.0,
                                                        margin: const EdgeInsets.all(4.0),
                                                        child: ImageCacheManager.instance
                                                                .getImageWithIdIngredient(ingredient: state.ingredients[index]) ??
                                                            CachedNetworkImage(
                                                              imageUrl: state.ingredients[index].image!,
                                                              placeholder: (_, __) => SizedBox(
                                                                width: baseHeightOfIngredientElement,
                                                                child: Image.asset(ImageAssets.chefYellow),
                                                              ),
                                                              errorWidget: (_, __, ___) {
                                                                return Image.asset(ImageAssets.chefYellow);
                                                              },
                                                            ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          state.ingredients[index].name ?? 'No name',
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
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 20.0,
                                left: 22.0,
                                right: 22.0,
                                child: Container(
                                  height: 56.0,
                                  decoration: BoxDecoration(boxShadow: AppShadows.containerOcreShadow),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                child: Container(
                                  width: stackWidth,
                                  padding: const EdgeInsets.only(
                                    bottom: 32.0,
                                    left: 22.0,
                                    right: 22.0,
                                  ),
                                  child: GlobalButton(
                                    key: UniqueKey(),
                                    height: 56.0,
                                    text: language.buttonWatchRecipes,
                                    fontText: AppFonts.normalMediumTextStyle,
                                    gradient: AppGradient.wheatMarigoldGradient,
                                    onTap: RouteSelectors.goToScreenRecipePage(),
                                  ),
                                ),
                              ),
                            ],
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
    final MainPageLanguage language = FlutterDictionary.instance.language?.mainPageLanguage ?? en.mainPageLanguage;

    final RenderBox renderBox = _textFieldContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    List<Ingredient>? existIngredients;

    return OverlayEntry(
      builder: (_) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: BlocSelector<HomePageCubit, HomePageState, List<Ingredient>>(
          bloc: context.watch(),
          selector: (HomePageState state) {
            existIngredients = state.ingredients;
            return state.tempIngredients;
          },
          builder: (
              BuildContext _,
              List<Ingredient> ingredients,
              ) {
            final List<Ingredient> tempIngredients = [];
            for (Ingredient ingredient in ingredients) {
              bool needAdd = true;
              for (Ingredient existIngredient in existIngredients!) {
                if (ingredient.id == existIngredient.id) {
                  needAdd = false;
                  break;
                }
              }
              if (needAdd == true) {
                tempIngredients.add(ingredient);
              }
            }

            final double containerHeight = tempIngredients.length > 3
                ? 195.0
                : tempIngredients.isEmpty
                ? baseHeightOfIngredientElement
                : baseHeightOfIngredientElement * tempIngredients.length * 1.25;
            final OverlayContainerClipper clipper = OverlayContainerClipper(
              borderRadius: 8.0,
              triangleHeight: 15.0,
              triangleWidth: 8.0,
            );

            return _textFromSearchTextField.isEmpty
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
                    child: tempIngredients.isEmpty
                        ? Container(
                      alignment: FlutterDictionary.instance.isRTL ? Alignment.bottomRight : Alignment.bottomLeft,
                      margin: const EdgeInsets.fromLTRB(22.0, 35.0, 22.0, 27.0),
                      child: Text(
                        language.notFound,
                        style: AppFonts.mediumBlack70TextStyle,
                      ),
                    )
                        : ListView.separated(
                      itemCount: tempIngredients.length,
                      padding: const EdgeInsets.only(top: 15.0),
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
                                  child: ImageCacheManager.instance.getImageWithIdIngredient(ingredient: tempIngredients[index]) ??
                                      CachedNetworkImage(
                                        imageUrl: tempIngredients[index].image!,
                                        imageBuilder: (BuildContext _, ImageProvider imageProvider) {
                                          return Image(image: imageProvider);
                                        },
                                        placeholder: (context, url) => SizedBox(
                                          width: baseHeightOfIngredientElement,
                                          child: Image.asset(ImageAssets.chefYellow),
                                        ),
                                        errorWidget: (context, url, error) {
                                          return Image.asset(ImageAssets.chefYellow);
                                        },
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
                            //context.read<HomePageCubit>().addIngredient(ingredient: tempIngredients[index]);
                            FocusManager.instance.primaryFocus!.unfocus();
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
