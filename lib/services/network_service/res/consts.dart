enum HttpType {
  httpGet,
  httpPost,
}

const int noConnectionStatusCode = -1;
const int networkStatusCodeOk = 200;
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

class HttpRoute {
  static const getFavorite = '/getFavorites';
  static const addFavorite = '/addFavorite';
  static const removeFavorite = '/removeFavorite';
  static const registration = '/registration';
  static const login = '/login';
  static const logout = '/logout';
  static const getIngredients = '/getIngredients';
  static const getRecipe = '/getRecipe';
  static const updateToken = '/updateToken';
  static const recover = '/recover';
  static const acceptCode = '/acceptCode';
  static const changePassword = '/changePassword';
  static const loginWithGoogle = '/loginGoogle';
  static const registerWithGoogle = '/registerGoogle';
}

const String googleLink = 'https://www.googleapis.com/auth/userinfo.profile';
const String googleAccountEmail = 'email';
const String data = 'data';
const String accept = 'accept';
const String contentTypeKey = 'Content-Type';
const String contentTypeValue = 'application/json';
const String tokenKey = 'Authorization';
const String bearerBase = 'Bearer ';
