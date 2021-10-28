import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_base_request.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class DeleteRequestModel implements IBaseRequest {
  final String url;
  final Map<String, String> headers;

  const DeleteRequestModel({
    this.url,
    this.headers,
  });

  @override
  Future<Response> call() {
    return http.delete(
      Uri.parse(url),
      headers: headers,
    );
  }
}
