import 'dart:convert';

import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_base_request.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class PostRequestModel implements IBaseRequest {
  final String url;
  final Map<String, String> headers;
  final Map<String, dynamic>? body;

  const PostRequestModel({
    required this.url,
    required this.headers,
    required this.body,
  });

  @override
  Future<Response> call() {
    return http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );
  }
}
