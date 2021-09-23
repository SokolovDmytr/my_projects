import 'package:yellow_team_fridge/services/network_service/interfaces/i_base_http_error.dart';

class BaseHttpResponse<T> {
  final IBaseHttpError error;

  final T response;

  BaseHttpResponse({
    this.error,
    this.response,
  });
}
