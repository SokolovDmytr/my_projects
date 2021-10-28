import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_base_request.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class PatchRequestModel implements IBaseRequest {
  final String url;
  final Map<String, String> headers;
  final Map<String, String> body;

  const PatchRequestModel({
    required this.url,
    required this.headers,
    required this.body,
  });

  @override
  Future<Response> call() {
    return http.patch(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  }
}
