import 'package:meta/meta.dart';

@immutable
class ApiException implements Exception {
  const ApiException(this.code, this.message)
    : innerException = null,
      stackTrace = null;

  const ApiException.withInner(
    this.code,
    this.message,
    this.innerException,
    this.stackTrace,
  );

  final int code;
  final String? message;
  final Exception? innerException;
  final StackTrace? stackTrace;

  @override
  String toString() {
    if (message == null) {
      return 'ApiException';
    }
    if (innerException == null) {
      return 'ApiException $code: $message';
    }
    return 'ApiException $code: $message (Inner exception: $innerException)\n\n$stackTrace';
  }
}
