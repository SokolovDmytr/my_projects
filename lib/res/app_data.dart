import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/on_boarding_screen_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class OnBoardingScreenData {
  static List<String> get hintsText {
    final OnBoardingScreenLanguage language =
        FlutterDictionary.instance.language?.onBoardingScreenLanguage ?? en.onBoardingScreenLanguage;
    return [
      language.onBoardingScreenOne,
      language.onBoardingScreenTwo,
      language.onBoardingScreenThree,
      language.onBoardingScreenFour,
    ];
  }

  static List<String> get hintsPictures {
    return [
      ImageAssets.onBoardingOne,
      ImageAssets.onBoardingTwo,
      ImageAssets.onBoardingThree,
      ImageAssets.onBoardingFour,
    ];
  }
}
