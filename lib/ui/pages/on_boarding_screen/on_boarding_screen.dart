import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/on_boarding_screen_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_data.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';
import 'package:yellow_team_fridge/ui/pages/on_boarding_screen/on_boarding_screen_vm.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen() : super(key: Key('OnBoardingScreen'));

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<T> map<T>(List list, Function handler) {
    final List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final OnBoardingScreenLanguage _language =
        FlutterDictionary.instance.language?.onBoardingScreenLanguage ?? en.onBoardingScreenLanguage;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
      ),
      child: StoreConnector<AppState, OnBoardingScreenViewModel>(
        converter: OnBoardingScreenViewModel.init,
        builder: (BuildContext context, OnBoardingScreenViewModel vm) => SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  vm.currentIndexDots == 3 ? Image.asset(ImageAssets.confetti) : SizedBox(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 84.0, left: 50.0, right: 50.0),
                        child: CarouselSlider.builder(
                          carouselController: vm.buttonCarouselController,
                          itemCount: OnBoardingScreenData.hintsText.length,
                          itemBuilder: (context, indexCurrent) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 60.0),
                                  child: Text(
                                    OnBoardingScreenData.hintsText[indexCurrent],
                                    style: AppFonts.normalBlackTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Image.asset(OnBoardingScreenData.hintsPictures[indexCurrent]),
                              ],
                            );
                          },
                          options: CarouselOptions(
                            height: 450.0,
                            viewportFraction: 1.0,
                            scrollPhysics: NeverScrollableScrollPhysics(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(OnBoardingScreenData.hintsText, (index, url) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: vm.currentIndexDots == index ? AppColors.marigold : AppColors.wheat,
                                    ),
                                    color: vm.currentIndexDots == index ? AppColors.marigold : AppColors.white),
                              ),
                            );
                          }),
                        ),
                      ),
                      GlobalButton(
                        key: Key('onBoardingButton${vm.currentIndexDots}'),
                        text: vm.currentIndexDots == 3 ? _language.buttonStart : _language.buttonNext,
                        fontText: AppFonts.normalMediumTextStyle,
                        height: 56.0,
                        padding: const EdgeInsets.symmetric(horizontal:  31.0),
                        onTap: () {
                          vm.currentIndexDots == 3 ? vm.startUsage() : vm.nextSlide();
                        },
                        gradient: AppGradient.wheatMarigoldGradient,
                        shadows: AppShadows.buttonOcreShadow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
