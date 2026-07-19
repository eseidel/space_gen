import 'package:discord/model_helpers.dart';
import 'package:discord/models/error_details.dart';
import 'package:meta/meta.dart';

/// {@template error_response}
/// Errors object returned by the Discord API
/// {@endtemplate}
@immutable
class ErrorResponse {
  /// {@macro error_response}
  const ErrorResponse({required this.code, required this.message, this.errors});

  /// Converts a `Map<String, dynamic>` to an [ErrorResponse].
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ErrorResponse',
      json,
      () => ErrorResponse(
        code: json['code'] as int,
        message: json['message'] as String,
        errors: ErrorDetails.maybeFromJson(
          json['errors'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ErrorResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ErrorResponse.fromJson(json);
  }

  /// Discord internal error code. See error code reference
  final int code;

  /// Human-readable error message
  final String message;
  final ErrorDetails? errors;

  /// Converts an [ErrorResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message, 'errors': errors?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([code, message, errors]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorResponse &&
        code == other.code &&
        message == other.message &&
        errors == other.errors;
  }
}
