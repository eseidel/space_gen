import 'package:github/model_helpers.dart';
import 'package:github/models/org_ruleset_conditions.dart';
import 'package:github/models/repos_update_org_ruleset_request_target.dart';
import 'package:github/models/repository_rule.dart';
import 'package:github/models/repository_rule_enforcement.dart';
import 'package:github/models/repository_ruleset_bypass_actor.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateOrgRulesetRequest {
  const ReposUpdateOrgRulesetRequest({
    this.name,
    this.target,
    this.enforcement,
    this.bypassActors,
    this.conditions,
    this.rules,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateOrgRulesetRequest].
  factory ReposUpdateOrgRulesetRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateOrgRulesetRequest',
      json,
      () => ReposUpdateOrgRulesetRequest(
        name: json['name'] as String?,
        target: ReposUpdateOrgRulesetRequestTarget.maybeFromJson(
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
        conditions: OrgRulesetConditions.maybeFromJson(
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
  static ReposUpdateOrgRulesetRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateOrgRulesetRequest.fromJson(json);
  }

  /// The name of the ruleset.
  final String? name;

  /// The target of the ruleset
  final ReposUpdateOrgRulesetRequestTarget? target;

  /// The enforcement level of the ruleset. `evaluate` allows admins to test
  /// rules before enforcing them. Admins can view insights on the Rule
  /// Insights page (`evaluate` is only available with GitHub Enterprise).
  final RepositoryRuleEnforcement? enforcement;

  /// The actors that can bypass the rules in this ruleset
  final List<RepositoryRulesetBypassActor>? bypassActors;

  /// Organization ruleset conditions
  /// Conditions for an organization ruleset.
  /// The branch and tag rulesets conditions object should contain both
  /// `repository_name` and `ref_name` properties, or both `repository_id` and
  /// `ref_name` properties, or both `repository_property` and `ref_name`
  /// properties.
  /// The push rulesets conditions object does not require the `ref_name`
  /// property.
  /// For repository policy rulesets, the conditions object should only
  /// contain the `repository_name`, the `repository_id`, or the
  /// `repository_property`.
  final OrgRulesetConditions? conditions;

  /// An array of rules within the ruleset.
  final List<RepositoryRule>? rules;

  /// Converts a [ReposUpdateOrgRulesetRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'target': target?.toJson(),
      'enforcement': enforcement?.toJson(),
      'bypass_actors': bypassActors?.map((e) => e.toJson()).toList(),
      'conditions': conditions?.toJson(),
      'rules': rules?.map((e) => e.toJson()).toList(),
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
    return other is ReposUpdateOrgRulesetRequest &&
        name == other.name &&
        target == other.target &&
        enforcement == other.enforcement &&
        listsEqual(bypassActors, other.bypassActors) &&
        conditions == other.conditions &&
        listsEqual(rules, other.rules);
  }
}
