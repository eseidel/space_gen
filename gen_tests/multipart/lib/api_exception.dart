import 'package:meta/meta.dart';

/// An exception thrown by the API client.
///
/// This is a wrapper around the underlying network exceptions.
/// This is used to provide a standard exception type for clients to handle.
///
/// The generic `T` is the parsed body of the error response, as declared by
/// the operation's `default:` (or error) response in the OpenAPI spec. For
/// operations that do not declare a typed error body, `T` is `dynamic` and
/// [body] is always null.
@immutable
class ApiException<T> implements Exception {
  const ApiException(this.code, this.message, {this.body})
    : innerException = null,
      stackTrace = null;

  const ApiException.unhandled(this.code)
    : message = 'Unhandled response',
      body = null,
      innerException = null,
      stackTrace = null;

  const ApiException.withInner(
    this.code,
    this.message,
    this.innerException,
    this.stackTrace,
  ) : body = null;

  final int code;
  final String? message;

  /// The parsed error body, if the operation's `default:` response declared
  /// a schema. Null otherwise.
  final T? body;
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
    return 'ApiException $code: $message '
        '(Inner exception: $innerException)\n\n$stackTrace';
  }
}

/// Validates a number.
///
/// These are extensions on the num type that throw an exception if the value
/// does not meet the validation criteria.
extension ValidateNumber on num {
  void validateMinimum(num minimum) {
    if (this < minimum) {
      throw Exception('must be greater than or equal to $minimum');
    }
  }

  void validateMaximum(num maximum) {
    if (this > maximum) {
      throw Exception('must be less than or equal to $maximum');
    }
  }

  void validateExclusiveMinimum(num minimum) {
    if (this <= minimum) {
      throw Exception('must be greater than $minimum');
    }
  }

  void validateExclusiveMaximum(num maximum) {
    if (this >= maximum) {
      throw Exception('must be less than $maximum');
    }
  }

  void validateMultipleOf(num multiple) {
    if (this % multiple != 0) {
      throw Exception('must be a multiple of $multiple');
    }
  }
}

/// Validates a string.
///
/// These are extensions on the String type that throw an exception if the value
/// does not meet the validation criteria.
extension ValidateString on String {
  void validateMinimumLength(int minimum) {
    if (length < minimum) {
      throw Exception('must be at least $minimum characters long');
    }
  }

  void validateMaximumLength(int maximum) {
    if (length > maximum) {
      throw Exception('must be at most $maximum characters long');
    }
  }

  void validatePattern(String pattern) {
    if (!RegExp(pattern).hasMatch(this)) {
      throw Exception('must match the pattern $pattern');
    }
  }
}

extension ValidateArray<T> on List<T> {
  void validateMaximumItems(int maximum) {
    if (length > maximum) {
      throw Exception('must be at most $maximum items long');
    }
  }

  void validateMinimumItems(int minimum) {
    if (length < minimum) {
      throw Exception('must be at least $minimum items long');
    }
  }

  void validateUniqueItems() {
    if (toSet().length != length) {
      throw Exception('must contain unique items');
    }
  }
}
