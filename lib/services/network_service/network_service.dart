import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/internet_connection_helper.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_base_http_error.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/no_connection_http_error.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

/// [NetworkService] it is Service for get data from server.
/// In our architecture we does use this service from [Request] classes from [network/requests/] folder.
/// This service have a prams:
/// variables:
///   - [baseUrl]. This variable does set with [init] method or [overrideBaseUrl]. This variable does contains a base link for http requests.
///   - [_errors]. This list does initialize with [init] method. This list does contains all specific errors for Network.
/// methods:
///   - [init]. This method will initialize [_errors] and [baseUrl] variables. It should be used after start of application in [initializeEpic].
///   - [request]. This is a main method of [NetworkService]. This method will return a [BaseHttpResponse].
///   - [overrideBaseUrl]. This method can set a new value to [baseUrl].
///   - [_getCheckedForErrorResponse]. This method will check a response for all basic errors.
///   - [_checkInternetConnection]. This method will check internet connection of app.
///   - [_getErrorByCode]. This method will return a error text by error code.
class NetworkService {
  static const tag = '[NetworkService]';

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  /// Basic url for requests. This variable will use as default but can be updated by [overrideBaseUrl].
  /// All request builders use this variable for build request but also have a param [url].
  String? _baseUrl;
  late Dio _dio;

  NetworkService._privateConstructor() {
    _dio = Dio();
  }

  /// This function will update a [baseUrl]. Not required for use.
  void overrideBaseUrl(String url) => _baseUrl = url;

  String? get baseUrl => _baseUrl ?? baseUrl;

  void init({
    required String baseUrl,
  }) {
    _baseUrl = baseUrl;
  }

  Future<BaseHttpResponse> _request({
    required HttpType type,
    required String route,
    required Map<String, String> params,
  }) async {
    if (_baseUrl == null) {
      _baseUrl = baseUrl;
      throw Exception('Base url must be initialize: current url $_baseUrl');
    }

    Response? response;
    try {
      String url = _baseUrl! + route;
      switch (type) {
        case HttpType.httpGet:
          response = await _dio.get(
            url,
            queryParameters: params,
          );
          break;
        case HttpType.httpPost:
          response = await _dio.post(
            url,
            queryParameters: params,
          );
          break;
      }

      logger.d('Response status code ${response.statusCode}');
      if (response.statusCode == null || response.statusCode! >= 300) {
        logger.e(response.data);
        return BaseHttpResponse(
          error: NoConnectionHttpError(
            error: response.data,
            statusCode: response.statusCode ?? noConnectionStatusCode,
          ),
        );
      }

      return BaseHttpResponse(
        response: json.decode(response.data),
      );
    } on DioError catch (error) {
      logger.e(error);

      return BaseHttpResponse(
        error: IBaseHttpError(
          error: error.toString(),
          statusCode: response?.statusCode ?? noConnectionStatusCode,
        ),
      );
    }
  }

  Future<BaseHttpResponse> requestWithParams({
    required HttpType type,
    required String route,
    required IParameter parameter,
  }) {
    return _request(
      type: type,
      route: route,
      params: parameter.getParams(),
    );
  }

  Future<bool> checkInternetConnection() async {
    return await InternetConnectionHelper.hasInternetConnection();
  }
}
