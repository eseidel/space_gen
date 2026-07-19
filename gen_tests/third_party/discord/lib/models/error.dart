import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template error}
/// A single error, either for an API response or a specific field.
/// {@endtemplate}
@immutable
class Error {
  /// {@macro error}
  const Error({required this.code, required this.message});

  /// Converts a `Map<String, dynamic>` to an [Error].
  factory Error.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Error',
      json,
      () =>
          Error(code: json['code'] as int, message: json['message'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Error? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Error.fromJson(json);
  }

  /// Discord internal error code. See error code reference
  final int code;

  /// Human-readable error message
  final String message;

  /// Converts an [Error] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }

  @override
  int get hashCode => Object.hashAll([code, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Error && code == other.code && message == other.message;
  }
}
