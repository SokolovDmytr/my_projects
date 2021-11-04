import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingredients_event.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/on_boarding_screen_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_data.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';
import 'package:provider/src/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen() : super(key: UniqueKey());

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndexDots = 0;
  final CarouselController _buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();

    context.read<IngredientsBloc>().add(
          LoadAllIngredientsEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final OnBoardingScreenLanguage _language = FlutterDictionary.instance.language?.onBoardingScreenLanguage ?? en.onBoardingScreenLanguage;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              _currentIndexDots == 3
                  ? Image.asset(
                      ImageAssets.confetti,
                      width: MediaQuery.of(context).size.width,
                    )
                  : const SizedBox(),
              Column(
                children: [
                  CarouselSlider(
                    carouselController: _buttonCarouselController,
                    items: _formScreenList(),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        _currentIndexDots = index;
                        setState(() {});
                      },
                      height: 552.0,
                      viewportFraction: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0, top: 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(
                        OnBoardingScreenData.hintsText,
                        (index, _) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _currentIndexDots == index ? AppColors.marigold : AppColors.wheat,
                                ),
                                color: _currentIndexDots == index ? AppColors.marigold : AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 31.0, right: 31.0, bottom: 50.0),
                    child: GlobalButton(
                      key: UniqueKey(),
                      text: _currentIndexDots == 3 ? _language.buttonStart : _language.buttonNext,
                      fontText: AppFonts.normalMediumTextStyle,
                      height: 56.0,
                      onTap: () => setState(() {
                        _currentIndexDots == 3 ? _startAction() : _nextAction();
                      }),
                      gradient: AppGradient.wheatMarigoldGradient,
                      shadows: AppShadows.buttonOcreShadow,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _formScreenList() {
    final List<Widget> screens = [];
    for (int index = 0; index < 4; index++) {
      screens.add(
        Container(
          color: AppColors.white,
          margin: index == 0
              ? EdgeInsets.only(top: 92.0, left: 20.0, right: 20.0)
              : index == 1
                  ? const EdgeInsets.only(top: 92.0, left: 38.0, right: 38.0)
                  : index == 2
                      ? const EdgeInsets.only(top: 92.0, left: 31.0)
                      : const EdgeInsets.only(top: 80.0, left: 50.0, right: 50.0),
          child: Column(
            children: [
              Padding(
                padding: index == 2
                    ? const EdgeInsets.only(bottom: 70.0, left: 30.0, right: 50.0)
                    : const EdgeInsets.only(bottom: 70.0, left: 30.0, right: 30.0),
                child: Text(
                  OnBoardingScreenData.hintsText[index],
                  style: AppFonts.normalBlackTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(OnBoardingScreenData.hintsPictures[index]),
            ],
          ),
        ),
      );
    }
    return screens;
  }

  void _nextAction() {
    _buttonCarouselController.animateToPage(
      _currentIndexDots = _currentIndexDots + 1,
      duration: AppDuration.onBoardingScreenDuration,
    );
  }

  void _startAction() {
    UserInformationService.instance.visitApp();
    RouteSelectors.goToHomePage().call();
  }

  List<T> map<T>(List list, Function handler) {
    final List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
