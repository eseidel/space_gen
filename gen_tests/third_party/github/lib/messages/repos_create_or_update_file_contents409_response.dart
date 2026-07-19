// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/basic_error.dart';
import 'package:github/models/repository_rule_violation_error.dart';
import 'package:meta/meta.dart';

sealed class ReposCreateOrUpdateFileContents409Response {
  const ReposCreateOrUpdateFileContents409Response();

  factory ReposCreateOrUpdateFileContents409Response.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('url')) {
      return ReposCreateOrUpdateFileContents409ResponseBasicError(
        BasicError.fromJson(json),
      );
    }
    if (json.containsKey('metadata')) {
      return ReposCreateOrUpdateFileContents409ResponseRepositoryRuleViolationError(
        RepositoryRuleViolationError.fromJson(json),
      );
    }
    throw FormatException(
      'No variant of ReposCreateOrUpdateFileContents409Response matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateOrUpdateFileContents409Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateOrUpdateFileContents409Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ReposCreateOrUpdateFileContents409ResponseBasicError
    extends ReposCreateOrUpdateFileContents409Response {
  const ReposCreateOrUpdateFileContents409ResponseBasicError(this.value);

  final BasicError value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateOrUpdateFileContents409ResponseBasicError &&
        value == other.value;
  }
}

@immutable
final class ReposCreateOrUpdateFileContents409ResponseRepositoryRuleViolationError
    extends ReposCreateOrUpdateFileContents409Response {
  const ReposCreateOrUpdateFileContents409ResponseRepositoryRuleViolationError(
    this.value,
  );

  final RepositoryRuleViolationError value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ReposCreateOrUpdateFileContents409ResponseRepositoryRuleViolationError &&
        value == other.value;
  }
}
