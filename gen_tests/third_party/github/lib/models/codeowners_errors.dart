import 'package:github/model_helpers.dart';
import 'package:github/models/codeowners_errors_errors_inner.dart';
import 'package:meta/meta.dart';

/// {@template codeowners_errors}
/// CODEOWNERS errors
/// A list of errors found in a repo's CODEOWNERS file
/// {@endtemplate}
@immutable
class CodeownersErrors {
  /// {@macro codeowners_errors}
  const CodeownersErrors({required this.errors});

  /// Converts a `Map<String, dynamic>` to a [CodeownersErrors].
  factory CodeownersErrors.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeownersErrors',
      json,
      () => CodeownersErrors(
        errors: (json['errors'] as List)
            .map<CodeownersErrorsErrorsInner>(
              (e) => CodeownersErrorsErrorsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeownersErrors? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeownersErrors.fromJson(json);
  }

  final List<CodeownersErrorsErrorsInner> errors;

  /// Converts a [CodeownersErrors] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'errors': errors.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(errors).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeownersErrors && listsEqual(errors, other.errors);
  }
}
