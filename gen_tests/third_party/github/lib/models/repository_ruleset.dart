import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule.dart';
import 'package:github/models/repository_rule_enforcement.dart';
import 'package:github/models/repository_ruleset_bypass_actor.dart';
import 'package:github/models/repository_ruleset_conditions_1.dart';
import 'package:github/models/repository_ruleset_current_user_can_bypass.dart';
import 'package:github/models/repository_ruleset_links.dart';
import 'package:github/models/repository_ruleset_source_type.dart';
import 'package:github/models/repository_ruleset_target.dart';
import 'package:meta/meta.dart';

/// {@template repository_ruleset}
/// Repository ruleset
/// A set of rules to apply when specified conditions are met.
/// {@endtemplate}
@immutable
class RepositoryRuleset {
  /// {@macro repository_ruleset}
  const RepositoryRuleset({
    required this.id,
    required this.name,
    required this.source,
    required this.enforcement,
    this.target,
    this.sourceType,
    this.bypassActors,
    this.currentUserCanBypass,
    this.nodeId,
    this.links,
    this.conditions,
    this.rules,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleset].
  factory RepositoryRuleset.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleset',
      json,
      () => RepositoryRuleset(
        id: json['id'] as int,
        name: json['name'] as String,
        target: RepositoryRulesetTarget.maybeFromJson(
          json['target'] as String?,
        ),
        sourceType: RepositoryRulesetSourceType.maybeFromJson(
          json['source_type'] as String?,
        ),
        source: json['source'] as String,
        enforcement: RepositoryRuleEnforcement.fromJson(
          json['enforcement'] as String,
        ),
        bypassActors: (json['bypass_actors'] as List?)
            ?.map<RepositoryRulesetBypassActor>(
              (e) => RepositoryRulesetBypassActor.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        currentUserCanBypass:
            RepositoryRulesetCurrentUserCanBypass.maybeFromJson(
              json['current_user_can_bypass'] as String?,
            ),
        nodeId: json['node_id'] as String?,
        links: RepositoryRulesetLinks.maybeFromJson(
          json['_links'] as Map<String, dynamic>?,
        ),
        conditions: RepositoryRulesetConditions1.maybeFromJson(
          json['conditions'] as Map<String, dynamic>?,
        ),
        rules: (json['rules'] as List?)
            ?.map<RepositoryRule>(
              (e) => RepositoryRule.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleset? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleset.fromJson(json);
  }

  /// The ID of the ruleset
  final int id;

  /// The name of the ruleset
  final String name;

  /// The target of the ruleset
  final RepositoryRulesetTarget? target;

  /// The type of the source of the ruleset
  final RepositoryRulesetSourceType? sourceType;

  /// The name of the source
  final String source;

  /// The enforcement level of the ruleset. `evaluate` allows admins to test
  /// rules before enforcing them. Admins can view insights on the Rule
  /// Insights page (`evaluate` is only available with GitHub Enterprise).
  final RepositoryRuleEnforcement enforcement;

  /// The actors that can bypass the rules in this ruleset
  final List<RepositoryRulesetBypassActor>? bypassActors;

  /// The bypass type of the user making the API request for this ruleset.
  /// This field is only returned when
  /// querying the repository-level endpoint.
  final RepositoryRulesetCurrentUserCanBypass? currentUserCanBypass;
  final String? nodeId;
  final RepositoryRulesetLinks? links;
  final RepositoryRulesetConditions1? conditions;
  final List<RepositoryRule>? rules;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Converts a [RepositoryRuleset] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'target': target?.toJson(),
      'source_type': sourceType?.toJson(),
      'source': source,
      'enforcement': enforcement.toJson(),
      'bypass_actors': bypassActors?.map((e) => e.toJson()).toList(),
      'current_user_can_bypass': currentUserCanBypass?.toJson(),
      'node_id': nodeId,
      '_links': links?.toJson(),
      'conditions': conditions?.toJson(),
      'rules': rules?.map((e) => e.toJson()).toList(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    target,
    sourceType,
    source,
    enforcement,
    listHash(bypassActors),
    currentUserCanBypass,
    nodeId,
    links,
    conditions,
    listHash(rules),
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleset &&
        id == other.id &&
        name == other.name &&
        target == other.target &&
        sourceType == other.sourceType &&
        source == other.source &&
        enforcement == other.enforcement &&
        listsEqual(bypassActors, other.bypassActors) &&
        currentUserCanBypass == other.currentUserCanBypass &&
        nodeId == other.nodeId &&
        links == other.links &&
        conditions == other.conditions &&
        listsEqual(rules, other.rules) &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
