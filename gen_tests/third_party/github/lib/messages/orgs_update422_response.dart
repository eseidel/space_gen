import 'package:github/models/validation_error.dart';
import 'package:github/models/validation_error_simple.dart';
import 'package:meta/meta.dart';

sealed class OrgsUpdate422Response {
  const OrgsUpdate422Response();

  factory OrgsUpdate422Response.fromJson(Map<String, dynamic> json) {
    if (json['errors'] is List &&
        (json['errors'] as List).isNotEmpty &&
        (json['errors'] as List).first is Map<String, dynamic>) {
      return OrgsUpdate422ResponseValidationError(
        ValidationError.fromJson(json),
      );
    }
    return OrgsUpdate422ResponseValidationErrorSimple(
      ValidationErrorSimple.fromJson(json),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdate422Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdate422Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class OrgsUpdate422ResponseValidationError extends OrgsUpdate422Response {
  const OrgsUpdate422ResponseValidationError(this.value);

  final ValidationError value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdate422ResponseValidationError &&
        value == other.value;
  }
}

@immutable
final class OrgsUpdate422ResponseValidationErrorSimple
    extends OrgsUpdate422Response {
  const OrgsUpdate422ResponseValidationErrorSimple(this.value);

  final ValidationErrorSimple value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdate422ResponseValidationErrorSimple &&
        value == other.value;
  }
}
