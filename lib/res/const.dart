import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 80,
  ),
);

//region [Duration]
const Duration SECONDS_1 = Duration(seconds: 1);

const Duration MILLISECONDS_200 = Duration(milliseconds: 200);
const Duration MILLISECONDS_300 = Duration(milliseconds: 300);
const Duration MILLISECONDS_400 = Duration(milliseconds: 400);
const Duration MILLISECONDS_500 = Duration(milliseconds: 500);
const Duration MILLISECONDS_700 = Duration(milliseconds: 700);
const Duration MILLISECONDS_900 = Duration(milliseconds: 900);
//endregion

//region [Links]
const String WANNA_CREATE_MY_CATALOG_LINK = 'https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg';
const String CREATE_BY_LINK = 'https://appvesto.com/';
//endregion

//region [Main strings]
const String TITLE = 'My catalog';
const String EXAMPLE_ID = '1234';
const String empty_string = '';
const String question_mark = '?';

//endregion

//region [PLACEHOLDER TEXT]
const String placeholder_text =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
//endregion

//region [ScreenUtils]
const bool DESIGN_SCREEN_ALLOW_FONT_SCALING = true;
const double DESIGN_SCREEN_HEIGHT = 812.0;
const double DESIGN_SCREEN_WIDTH = 375.0;
const double MIN_TABLET_WIDTH = 600.0;
//endregion

//region [Keys]
const String KEY_NAME = 'name';
const String KEY_DESCRIPTION = 'description';
const String KEY_DESCRIPTION_2 = 'description2';
const String KEY_POINTS = 'points';
const String KEY_TITLE = 'title';
//endregion

//region [Errors]
const String ERROR = 'Error!';
//endregion

class ResponseKeys {
  static const String data = 'data';
}

class PageTypes {
  static const String HOME_TYPE = 'HOME';
  static const String SETTINGS_TYPE = 'SETTINGS';
  static const String SWITCH_TYPE = 'SWITCH';
  static const String SIGNOUT_TYPE = 'SIGNOUT';
  static const String ANOTHER_CATALOG = 'ANOTHER_CATALOG';
}

class FileTypes {
  static const IMAGE_TYPE = 'IMAGE';
  static const VIDEO_TYPE = 'VIDEO';
  static const PDF_TYPE = 'PDF';
}
