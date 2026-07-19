import 'package:github/model_helpers.dart';
import 'package:github/models/rule_suite_evaluation_result.dart';
import 'package:github/models/rule_suite_result.dart';
import 'package:github/models/rule_suite_rule_evaluations_inner.dart';
import 'package:meta/meta.dart';

/// {@template rule_suite}
/// Rule Suite
/// Response
/// {@endtemplate}
@immutable
class RuleSuite {
  /// {@macro rule_suite}
  const RuleSuite({
    this.id,
    this.actorId,
    this.actorName,
    this.beforeSha,
    this.afterSha,
    this.ref,
    this.repositoryId,
    this.repositoryName,
    this.pushedAt,
    this.result,
    this.evaluationResult,
    this.ruleEvaluations,
  });

  /// Converts a `Map<String, dynamic>` to a [RuleSuite].
  factory RuleSuite.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RuleSuite',
      json,
      () => RuleSuite(
        id: json['id'] as int?,
        actorId: json['actor_id'] as int?,
        actorName: json['actor_name'] as String?,
        beforeSha: json['before_sha'] as String?,
        afterSha: json['after_sha'] as String?,
        ref: json['ref'] as String?,
        repositoryId: json['repository_id'] as int?,
        repositoryName: json['repository_name'] as String?,
        pushedAt: maybeParseDateTime(json['pushed_at'] as String?),
        result: RuleSuiteResult.maybeFromJson(json['result'] as String?),
        evaluationResult: RuleSuiteEvaluationResult.maybeFromJson(
          json['evaluation_result'] as String?,
        ),
        ruleEvaluations: (json['rule_evaluations'] as List?)
            ?.map<RuleSuiteRuleEvaluationsInner>(
              (e) => RuleSuiteRuleEvaluationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RuleSuite? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RuleSuite.fromJson(json);
  }

  /// The unique identifier of the rule insight.
  final int? id;

  /// The number that identifies the user.
  final int? actorId;

  /// The handle for the GitHub user account.
  final String? actorName;

  /// The first commit sha before the push evaluation.
  final String? beforeSha;

  /// The last commit sha in the push evaluation.
  final String? afterSha;

  /// The ref name that the evaluation ran on.
  final String? ref;

  /// The ID of the repository associated with the rule evaluation.
  final int? repositoryId;

  /// The name of the repository without the `.git` extension.
  final String? repositoryName;

  /// Example: `'2011-01-26T19:06:43Z'`
  final DateTime? pushedAt;

  /// The result of the rule evaluations for rules with the `active`
  /// enforcement status.
  final RuleSuiteResult? result;

  /// The result of the rule evaluations for rules with the `active` and
  /// `evaluate` enforcement statuses, demonstrating whether rules would pass
  /// or fail if all rules in the rule suite were `active`. Null if no rules
  /// with `evaluate` enforcement status were run.
  final RuleSuiteEvaluationResult? evaluationResult;

  /// Details on the evaluated rules.
  final List<RuleSuiteRuleEvaluationsInner>? ruleEvaluations;

  /// Converts a [RuleSuite] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'actor_id': actorId,
      'actor_name': actorName,
      'before_sha': ?beforeSha,
      'after_sha': ?afterSha,
      'ref': ?ref,
      'repository_id': ?repositoryId,
      'repository_name': ?repositoryName,
      'pushed_at': ?pushedAt?.toIso8601String(),
      'result': ?result?.toJson(),
      'evaluation_result': evaluationResult?.toJson(),
      'rule_evaluations': ?ruleEvaluations?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    actorId,
    actorName,
    beforeSha,
    afterSha,
    ref,
    repositoryId,
    repositoryName,
    pushedAt,
    result,
    evaluationResult,
    listHash(ruleEvaluations),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RuleSuite &&
        id == other.id &&
        actorId == other.actorId &&
        actorName == other.actorName &&
        beforeSha == other.beforeSha &&
        afterSha == other.afterSha &&
        ref == other.ref &&
        repositoryId == other.repositoryId &&
        repositoryName == other.repositoryName &&
        pushedAt == other.pushedAt &&
        result == other.result &&
        evaluationResult == other.evaluationResult &&
        listsEqual(ruleEvaluations, other.ruleEvaluations);
  }
}
