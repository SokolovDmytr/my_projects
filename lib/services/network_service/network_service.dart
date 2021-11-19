import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/network_service/interfaces/i_base_http_error.dart';
import 'package:memes/services/network_service/interfaces/i_parameter.dart';
import 'package:memes/services/network_service/models/base_http_response.dart';
import 'package:memes/services/network_service/models/no_connection_http_error.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  late Dio _dio;

  NetworkService._privateConstructor() {
    _dio = Dio();
  }

  Future<bool> checkInternetConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup(exampleUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  Future<BaseHttpResponse> request({
    required HttpType type,
    required String route,
    required IParameter parameter,
  }) async {
    Response? response;
    final String requestUrl = baseUrl + route;
    final Options options = Options(headers: {
      accept: contentTypeValue,
      contentTypeKey: contentTypeValue,
    });

    try {
      switch (type) {
        case HttpType.httpGet:
          response = await _dio.get(
            requestUrl,
            options: options,
            queryParameters: parameter.getParams(),
          );
          break;
        case HttpType.httpPost:
          response = await _dio.post(
            requestUrl,
            options: options,
            queryParameters: parameter.getParams(),
          );
          break;
      }

      if (response.statusCode == null || response.statusCode! >= 300) {
        return BaseHttpResponse(
          error: NoConnectionHttpError(
            error: response.data,
            statusCode: response.statusCode ?? noConnectionStatusCode,
          ),
        );
      }
      return BaseHttpResponse(response: json.decode(response.toString()));
    } on DioError catch (error) {
      BaseHttpResponse(
        error: IBaseHttpError(
          statusCode: response?.statusCode ?? noConnectionStatusCode,
          error: error.error,
        ),
      );
    }
    return BaseHttpResponse();
  }
}
