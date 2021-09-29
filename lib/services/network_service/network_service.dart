import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_base_request.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/models/no_connection_http_error.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/shared/request_builders.dart';

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

  NetworkService._privateConstructor();

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  /// Basic url for requests. This variable will use as default but can be updated by [overrideBaseUrl].
  /// All request builders use this variable for build request but also have a param [url].
  String baseUrl;

  /// This function will update a [baseUrl]. Not required for use.
  void overrideBaseUrl(String url) => baseUrl = baseUrl;

  void init({
    @required String baseUrl,
  }) {
    this.baseUrl = baseUrl;
  }

  Future<BaseHttpResponse> request({
    @required HttpType type,
    @required String route,
    @required Map<String, dynamic> body,
    @required Map<String, String> params,
    String token,
  }) async {
    final bool isConnection = await _checkInternetConnection();
    if (isConnection == false) {
      return BaseHttpResponse(
        error: NoConnectionHttpError(
          error: 'No connection',
          statusCode: noConnectionStatusCode,
        ),
      );
    }

    IBaseRequest request;
    switch (type) {
      case HttpType.httpGet:
        request = RequestBuilders.get(functionName: route, params: params, token: token);
        break;
      case HttpType.httpPost:
        request = RequestBuilders.post(functionName: route, params: params, body: body, token: token);
        break;
    }

    http.Response response;
    try {
      response = await request();
    } catch (error) {
      print(error);
    }

    print('Response status code ${response.statusCode}');
    if (response.statusCode >= 400) {
      return null;
    }

    logger.d(response.body);

    return BaseHttpResponse(
      response: json.decode(response.body),
    );
  }

  Future<BaseHttpResponse> requestWithParams({
    @required HttpType type,
    @required String route,
    @required IParameter parameter,
    String token,
  }) {
    return request(
      type: type,
      route: route,
      body: null,
      params: parameter.getParams(),
    );
  }

  Future<bool> _checkInternetConnection() async {
    return await DataConnectionChecker().hasConnection;
  }
}
