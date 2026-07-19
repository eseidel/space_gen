// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/repository_rule_violation_error.dart';
import 'package:github/models/validation_error.dart';
import 'package:meta/meta.dart';

sealed class GitCreateBlob422Response {
  const GitCreateBlob422Response();

  factory GitCreateBlob422Response.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('errors')) {
      return GitCreateBlob422ResponseValidationError(
        ValidationError.fromJson(json),
      );
    }
    if (json.containsKey('metadata')) {
      return GitCreateBlob422ResponseRepositoryRuleViolationError(
        RepositoryRuleViolationError.fromJson(json),
      );
    }
    throw FormatException(
      'No variant of GitCreateBlob422Response matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateBlob422Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateBlob422Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GitCreateBlob422ResponseValidationError
    extends GitCreateBlob422Response {
  const GitCreateBlob422ResponseValidationError(this.value);

  final ValidationError value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateBlob422ResponseValidationError &&
        value == other.value;
  }
}

@immutable
final class GitCreateBlob422ResponseRepositoryRuleViolationError
    extends GitCreateBlob422Response {
  const GitCreateBlob422ResponseRepositoryRuleViolationError(this.value);

  final RepositoryRuleViolationError value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateBlob422ResponseRepositoryRuleViolationError &&
        value == other.value;
  }
}
