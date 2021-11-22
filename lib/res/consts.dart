import 'package:logger/logger.dart';

enum HttpType { httpGet, httpPost }

enum AppBarType { titleAppBar, buttonsAppBar }

enum OptionsCardType { textFieldsCard, colorsCard }

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 80,
  ),
);

const String arcadeFont = 'Arcade';
const String baseUrl = 'https://api.imgflip.com';
const String accept = 'accept';
const String contentTypeKey = 'Content-Type';
const String contentTypeValue = 'application/json';
const String emptyString = '';
const String password = 'domestos1234';
const String userName = 'Domestos';
const String exampleUrl = 'example.com';
const int noConnectionStatusCode = -1;

const Map<String, String> parameterKeys = {
  'template_id': 'template_id',
  'username': 'username',
  'password': 'password',
};

class HttpRoute {
  static const String getMemes = '/get_memes';
  static const String captionImage = '/caption_image';
}
