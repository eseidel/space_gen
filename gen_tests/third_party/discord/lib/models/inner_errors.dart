import 'package:discord/model_helpers.dart';
import 'package:discord/models/error.dart';
import 'package:meta/meta.dart';

@immutable
class InnerErrors {
  const InnerErrors({required this.errors});

  /// Converts a `Map<String, dynamic>` to an [InnerErrors].
  factory InnerErrors.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InnerErrors',
      json,
      () => InnerErrors(
        errors: (json['_errors'] as List)
            .map<Error>((e) => Error.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InnerErrors? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InnerErrors.fromJson(json);
  }

  /// The list of errors for this field
  final List<Error> errors;

  /// Converts an [InnerErrors] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'_errors': errors.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(errors).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InnerErrors && listsEqual(errors, other.errors);
  }
}
