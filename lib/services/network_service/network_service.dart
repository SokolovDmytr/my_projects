import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/network_service/interfaces/i_parameter.dart';
import 'package:memes/services/network_service/models/base_http_response.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  late Dio _dio;

  NetworkService._privateConstructor() {
    _dio = Dio();
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
    return BaseHttpResponse(response: json.decode(response.toString()));
  }
}
