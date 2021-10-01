import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 80,
  ),
);

//region [Duration]
const Duration seconds1 = Duration(seconds: 1);

const Duration milliseconds200 = Duration(milliseconds: 200);
const Duration milliseconds300 = Duration(milliseconds: 300);
const Duration milliseconds400 = Duration(milliseconds: 400);
const Duration milliseconds500 = Duration(milliseconds: 500);
const Duration milliseconds700 = Duration(milliseconds: 700);
const Duration milliseconds900 = Duration(milliseconds: 900);
//endregion

//region [Links]
const String wannaCreateMyCatalogLink = 'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg';
const String createByLink = 'https://appvesto.com/';
//endregion

//region [Main strings]
const String title = 'My catalog';
const String exampleId = '1234';
const String emptyString = '';
const String questionMark = '?';
const String coma = ',';

//endregion

//region [PLACEHOLDER TEXT]
const String placeholder_text =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
//endregion

//region [ScreenUtils]
const bool designAllowFontScaling = true;
const double designScreenHeight = 812.0;
const double designScreenWidth = 375.0;
const double minTabletWidth = 600.0;
//endregion

//region [Keys]
const String keyName = 'name';
const String keyDescription = 'description';
const String keyDescription2 = 'description2';
const String keyPoints = 'points';
const String keyTitle = 'title';
//endregion

//region [Errors]
const String error = 'Error!';
//endregion

class ResponseKeys {
  static const String data = 'data';
}

class PageTypes {
  static const String homeType = 'HOME';
  static const String settingsType = 'SETTINGS';
  static const String switchType = 'SWITCH';
  static const String signOutType = 'SIGNOUT';
  static const String anotherCatalog = 'ANOTHER_CATALOG';
}

class FileTypes {
  static const imageType = 'IMAGE';
  static const videoType = 'VIDEO';
  static const pdfType = 'PDF';
}

enum AppBarType {
  home,
  simple,
  screenRecipe,
}

const double baseHeightOfIngredientElement = 55.0;
const double minSwipeDistance = 25.0;
