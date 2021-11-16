import 'package:memes/services/network_service/interfaces/i_base_http_error.dart';

class BaseHttpResponse<T> {
  final IBaseHttpError? error;
  final T? response;

  const BaseHttpResponse({
    this.error,
    this.response,
  });
}
