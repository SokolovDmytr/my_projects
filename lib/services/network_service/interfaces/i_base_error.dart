/// Interface for all basic errors. Does using in [NetworkService].
class IBaseError {
  final int statusCode;
  final String error;

  const IBaseError({
    this.error,
    this.statusCode,
  });
}
