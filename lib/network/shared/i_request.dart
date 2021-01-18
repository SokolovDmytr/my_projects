/// Interface for all requests in the application.
abstract class IRequest<T> {
  Future<T> call();
}