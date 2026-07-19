import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_commit_author_email_pattern_parameters_operator.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleCommitAuthorEmailPatternParameters {
  const RepositoryRuleCommitAuthorEmailPatternParameters({
    required this.operator_,
    required this.pattern,
    this.name,
    this.negate,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleCommitAuthorEmailPatternParameters].
  factory RepositoryRuleCommitAuthorEmailPatternParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleCommitAuthorEmailPatternParameters',
      json,
      () => RepositoryRuleCommitAuthorEmailPatternParameters(
        name: json['name'] as String?,
        negate: json['negate'] as bool?,
        operator_:
            RepositoryRuleCommitAuthorEmailPatternParametersOperator.fromJson(
              json['operator'] as String,
            ),
        pattern: json['pattern'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCommitAuthorEmailPatternParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCommitAuthorEmailPatternParameters.fromJson(json);
  }

  /// How this rule will appear to users.
  final String? name;

  /// If true, the rule will fail if the pattern matches.
  final bool? negate;

  /// The operator to use for matching.
  final RepositoryRuleCommitAuthorEmailPatternParametersOperator operator_;

  /// The pattern to match with.
  final String pattern;

  /// Converts a [RepositoryRuleCommitAuthorEmailPatternParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (negate != null) 'negate': negate,
      'operator': operator_.toJson(),
      'pattern': pattern,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, negate, operator_, pattern]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCommitAuthorEmailPatternParameters &&
        name == other.name &&
        negate == other.negate &&
        operator_ == other.operator_ &&
        pattern == other.pattern;
  }
}
