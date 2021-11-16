class IBaseHttpError {
  final int statusCode;
  final String error;

  const IBaseHttpError({
    required this.error,
    required this.statusCode,
  });
}
