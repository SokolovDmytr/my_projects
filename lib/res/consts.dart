enum HttpType { httpGet, httpPost }

enum AppBarType { titleAppBar, buttonsAppBar }

enum OptionsCardType { textFieldsCard, colorsCard }

const String baseUrl = 'https://api.imgflip.com';
const String accept = 'accept';
const String contentTypeKey = 'Content-Type';
const String contentTypeValue = 'application/json';
const String emptyString = '';
const String password = '77772493';
const String userName = 'DomestosKun';

const Map<String, String> parameterKeys = {
  'template_id': 'template_id',
  'username': 'username',
  'password': 'password',
};

class HttpRoute {
  static const String getMemes = '/get_memes';
  static const String captionImage = '/caption_image';
}
