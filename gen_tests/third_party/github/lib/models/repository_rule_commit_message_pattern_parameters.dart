import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_commit_message_pattern_parameters_operator.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleCommitMessagePatternParameters {
  const RepositoryRuleCommitMessagePatternParameters({
    required this.operator_,
    required this.pattern,
    this.name,
    this.negate,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleCommitMessagePatternParameters].
  factory RepositoryRuleCommitMessagePatternParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleCommitMessagePatternParameters',
      json,
      () => RepositoryRuleCommitMessagePatternParameters(
        name: json['name'] as String?,
        negate: json['negate'] as bool?,
        operator_:
            RepositoryRuleCommitMessagePatternParametersOperator.fromJson(
              json['operator'] as String,
            ),
        pattern: json['pattern'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCommitMessagePatternParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCommitMessagePatternParameters.fromJson(json);
  }

  /// How this rule will appear to users.
  final String? name;

  /// If true, the rule will fail if the pattern matches.
  final bool? negate;

  /// The operator to use for matching.
  final RepositoryRuleCommitMessagePatternParametersOperator operator_;

  /// The pattern to match with.
  final String pattern;

  /// Converts a [RepositoryRuleCommitMessagePatternParameters]
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
    return other is RepositoryRuleCommitMessagePatternParameters &&
        name == other.name &&
        negate == other.negate &&
        operator_ == other.operator_ &&
        pattern == other.pattern;
  }
}
