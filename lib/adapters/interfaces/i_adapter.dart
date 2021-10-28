import 'package:fridge_yellow_team_bloc/network/shared/i_request.dart';

/// Interface for adapters for http requests.
abstract class IAdapter<T> {
  final IRequest request;

  const IAdapter({
    required this.request,
  });

  Future<T> call();
}
