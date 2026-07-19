import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template validation_error_simple}
/// Validation Error Simple
/// Validation Error Simple
/// {@endtemplate}
@immutable
class ValidationErrorSimple {
  /// {@macro validation_error_simple}
  const ValidationErrorSimple({
    required this.message,
    required this.documentationUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [ValidationErrorSimple].
  factory ValidationErrorSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ValidationErrorSimple',
      json,
      () => ValidationErrorSimple(
        message: json['message'] as String,
        documentationUrl: json['documentation_url'] as String,
        errors: (json['errors'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidationErrorSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ValidationErrorSimple.fromJson(json);
  }

  final String message;
  final String documentationUrl;
  final List<String>? errors;

  /// Converts a [ValidationErrorSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'documentation_url': documentationUrl,
      'errors': ?errors,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, documentationUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationErrorSimple &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        listsEqual(errors, other.errors);
  }
}
