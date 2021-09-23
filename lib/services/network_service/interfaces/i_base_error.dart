
/// Interface for all basic errors. Does using in [NetworkService].
class IBaseError {
  int statusCode;
  String error;

  IBaseError({this.error, this.statusCode});
}