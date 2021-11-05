class ServerErrorException implements Exception {
  final String? message;

  const ServerErrorException({
    this.message,
  });
}
