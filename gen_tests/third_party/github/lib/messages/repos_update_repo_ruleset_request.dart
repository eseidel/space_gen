import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_repo_ruleset_request_target.dart';
import 'package:github/models/repository_rule.dart';
import 'package:github/models/repository_rule_enforcement.dart';
import 'package:github/models/repository_ruleset_bypass_actor.dart';
import 'package:github/models/repository_ruleset_conditions.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateRepoRulesetRequest {
  const ReposUpdateRepoRulesetRequest({
    this.name,
    this.target,
    this.enforcement,
    this.bypassActors,
    this.conditions,
    this.rules,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateRepoRulesetRequest].
  factory ReposUpdateRepoRulesetRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateRepoRulesetRequest',
      json,
      () => ReposUpdateRepoRulesetRequest(
        name: json['name'] as String?,
        target: ReposUpdateRepoRulesetRequestTarget.maybeFromJson(
          json['target'] as String?,
        ),
        enforcement: RepositoryRuleEnforcement.maybeFromJson(
          json['enforcement'] as String?,
        ),
        bypassActors: (json['bypass_actors'] as List?)
            ?.map<RepositoryRulesetBypassActor>(
              (e) => RepositoryRulesetBypassActor.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        conditions: RepositoryRulesetConditions.maybeFromJson(
          json['conditions'] as Map<String, dynamic>?,
        ),
        rules: (json['rules'] as List?)
            ?.map<RepositoryRule>(
              (e) => RepositoryRule.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRepoRulesetRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRepoRulesetRequest.fromJson(json);
  }

  /// The name of the ruleset.
  final String? name;

  /// The target of the ruleset
  final ReposUpdateRepoRulesetRequestTarget? target;

  /// The enforcement level of the ruleset. `evaluate` allows admins to test
  /// rules before enforcing them. Admins can view insights on the Rule
  /// Insights page (`evaluate` is only available with GitHub Enterprise).
  final RepositoryRuleEnforcement? enforcement;

  /// The actors that can bypass the rules in this ruleset
  final List<RepositoryRulesetBypassActor>? bypassActors;

  /// Repository ruleset conditions for ref names
  /// Parameters for a repository ruleset ref name condition
  final RepositoryRulesetConditions? conditions;

  /// An array of rules within the ruleset.
  final List<RepositoryRule>? rules;

  /// Converts a [ReposUpdateRepoRulesetRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'target': ?target?.toJson(),
      'enforcement': ?enforcement?.toJson(),
      'bypass_actors': ?bypassActors?.map((e) => e.toJson()).toList(),
      'conditions': ?conditions?.toJson(),
      'rules': ?rules?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    target,
    enforcement,
    listHash(bypassActors),
    conditions,
    listHash(rules),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateRepoRulesetRequest &&
        name == other.name &&
        target == other.target &&
        enforcement == other.enforcement &&
        listsEqual(bypassActors, other.bypassActors) &&
        conditions == other.conditions &&
        listsEqual(rules, other.rules);
  }
}
