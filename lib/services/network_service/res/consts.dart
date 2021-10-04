enum HttpType {
  httpGet,
  httpPost,
}

const int noConnectionStatusCode = -1;
const String baseUrl = 'http://104.236.36.62:8082';

const Map<String, String> parameterKeys = {
  'firstName': 'firstName',
  'email': 'email',
  'password': 'password',
  'token': 'token',
  'code': 'code',
  'id': 'id',
  'recipeId': 'i',
  'locale': 'locale',
  'ids': 'ids',
  'googleToken': 'googleToken',
  'str': 'str',
  'refreshToken': 'refreshToken',
};

class HttpRoute{
  static const getFavorite = '/getFavorites';
  static const login = '/login';
  static const getIngredients = '/getIngredients';
}

//delete
const String tmp_token = '27592e25-d3ae-4cf6-bd1b-1f3aa111a84b';

const String no_internet_connection = 'No Internet Connection';

const int HTTP_OK = 200;
const int HTTP_MAX_OK = 299;
const int HTTP_UNPROCESSABLE = 422;

const int BAD_GATEWAY_STATUS_CODE = 502;
const String DATA = 'data';

const String ACCEPT = 'accept';
const String CONTENT_TYPE_KEY = 'Content-Type';
const String CONTENT_TYPE_VALUE = 'application/json';
const String TOKEN_KEY = 'Authorization';
const String BEARER_BASE = 'Bearer ';

