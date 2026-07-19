import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/validate_entity400_response_errors_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ValidateEntity400Response {
  const ValidateEntity400Response({required this.errors});

  /// Converts a `Map<String, dynamic>` to a [ValidateEntity400Response].
  factory ValidateEntity400Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ValidateEntity400Response',
      json,
      () => ValidateEntity400Response(
        errors: (json['errors'] as List)
            .map<ValidateEntity400ResponseErrorsInner>(
              (e) => ValidateEntity400ResponseErrorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidateEntity400Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ValidateEntity400Response.fromJson(json);
  }

  final List<ValidateEntity400ResponseErrorsInner> errors;

  /// Converts a [ValidateEntity400Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'errors': errors.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(errors).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidateEntity400Response &&
        listsEqual(errors, other.errors);
  }
}
