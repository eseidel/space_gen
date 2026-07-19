import 'package:github/model_helpers.dart';
import 'package:github/models/validation_error_errors_inner.dart';
import 'package:meta/meta.dart';

/// {@template validation_error}
/// Validation Error
/// Validation Error
/// {@endtemplate}
@immutable
class ValidationError {
  /// {@macro validation_error}
  const ValidationError({
    required this.message,
    required this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ValidationError].
  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ValidationError',
      json,
      () => ValidationError(
        message: json['message'] as String,
        documentationUrl: json['documentation_url'] as String,
        errors: (json['errors'] as List?)
            ?.map<ValidationErrorErrorsInner>(
              (e) => ValidationErrorErrorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidationError? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ValidationError.fromJson(json);
  }

  final String message;
  final String documentationUrl;
  final List<ValidationErrorErrorsInner>? errors;

  /// Converts a [ValidationError] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'documentation_url': documentationUrl,
      'errors': errors?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, documentationUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationError &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
