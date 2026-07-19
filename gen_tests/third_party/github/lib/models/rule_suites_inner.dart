import 'package:github/model_helpers.dart';
import 'package:github/models/rule_suites_inner_evaluation_result.dart';
import 'package:github/models/rule_suites_inner_result.dart';
import 'package:meta/meta.dart';

@immutable
class RuleSuitesInner {
  const RuleSuitesInner({
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
  });

  /// Converts a `Map<String, dynamic>` to a [RuleSuitesInner].
  factory RuleSuitesInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RuleSuitesInner',
      json,
      () => RuleSuitesInner(
        id: json['id'] as int?,
        actorId: json['actor_id'] as int?,
        actorName: json['actor_name'] as String?,
        beforeSha: json['before_sha'] as String?,
        afterSha: json['after_sha'] as String?,
        ref: json['ref'] as String?,
        repositoryId: json['repository_id'] as int?,
        repositoryName: json['repository_name'] as String?,
        pushedAt: maybeParseDateTime(json['pushed_at'] as String?),
        result: RuleSuitesInnerResult.maybeFromJson(json['result'] as String?),
        evaluationResult: RuleSuitesInnerEvaluationResult.maybeFromJson(
          json['evaluation_result'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RuleSuitesInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RuleSuitesInner.fromJson(json);
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
  final RuleSuitesInnerResult? result;

  /// The result of the rule evaluations for rules with the `active` and
  /// `evaluate` enforcement statuses, demonstrating whether rules would pass
  /// or fail if all rules in the rule suite were `active`.
  final RuleSuitesInnerEvaluationResult? evaluationResult;

  /// Converts a [RuleSuitesInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'actor_id': actorId,
      'actor_name': actorName,
      'before_sha': beforeSha,
      'after_sha': afterSha,
      'ref': ref,
      'repository_id': repositoryId,
      'repository_name': repositoryName,
      'pushed_at': pushedAt?.toIso8601String(),
      'result': result?.toJson(),
      'evaluation_result': evaluationResult?.toJson(),
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
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RuleSuitesInner &&
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
        evaluationResult == other.evaluationResult;
  }
}
