import 'package:http/http.dart';

/// Interface of BaseRequests. All main examples of [IBaseRequest] contains in [RequestBuilders] class.
abstract class IBaseRequest {
  Future<Response> call();
}