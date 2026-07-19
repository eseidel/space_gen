import 'package:github/model_helpers.dart';
import 'package:github/models/validation_error_errors_inner_value.dart';
import 'package:meta/meta.dart';

@immutable
class ValidationErrorErrorsInner {
  const ValidationErrorErrorsInner({
    required this.code,
    this.resource,
    this.field,
    this.message,
    this.index,
    this.value,
  });

  /// Converts a `Map<String, dynamic>` to a [ValidationErrorErrorsInner].
  factory ValidationErrorErrorsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ValidationErrorErrorsInner',
      json,
      () => ValidationErrorErrorsInner(
        resource: json['resource'] as String?,
        field: json['field'] as String?,
        message: json['message'] as String?,
        code: json['code'] as String,
        index: json['index'] as int?,
        value: ValidationErrorErrorsInnerValue.maybeFromJson(
          json['value'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidationErrorErrorsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ValidationErrorErrorsInner.fromJson(json);
  }

  final String? resource;
  final String? field;
  final String? message;
  final String code;
  final int? index;
  final ValidationErrorErrorsInnerValue? value;

  /// Converts a [ValidationErrorErrorsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'resource': ?resource,
      'field': ?field,
      'message': ?message,
      'code': code,
      'index': ?index,
      'value': ?value?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([resource, field, message, code, index, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationErrorErrorsInner &&
        resource == other.resource &&
        field == other.field &&
        message == other.message &&
        code == other.code &&
        index == other.index &&
        value == other.value;
  }
}
