class ServerError implements Exception {
  final String? message;

  const ServerError({
    this.message,
  });
}
