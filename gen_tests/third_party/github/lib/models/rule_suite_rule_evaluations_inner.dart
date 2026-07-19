import 'package:github/model_helpers.dart';
import 'package:github/models/rule_suite_rule_evaluations_inner_enforcement.dart';
import 'package:github/models/rule_suite_rule_evaluations_inner_result.dart';
import 'package:github/models/rule_suite_rule_evaluations_inner_rule_source.dart';
import 'package:meta/meta.dart';

@immutable
class RuleSuiteRuleEvaluationsInner {
  const RuleSuiteRuleEvaluationsInner({
    this.ruleSource,
    this.enforcement,
    this.result,
    this.ruleType,
    this.details,
  });

  /// Converts a `Map<String, dynamic>` to a [RuleSuiteRuleEvaluationsInner].
  factory RuleSuiteRuleEvaluationsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RuleSuiteRuleEvaluationsInner',
      json,
      () => RuleSuiteRuleEvaluationsInner(
        ruleSource: RuleSuiteRuleEvaluationsInnerRuleSource.maybeFromJson(
          json['rule_source'] as Map<String, dynamic>?,
        ),
        enforcement: RuleSuiteRuleEvaluationsInnerEnforcement.maybeFromJson(
          json['enforcement'] as String?,
        ),
        result: RuleSuiteRuleEvaluationsInnerResult.maybeFromJson(
          json['result'] as String?,
        ),
        ruleType: json['rule_type'] as String?,
        details: json['details'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RuleSuiteRuleEvaluationsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RuleSuiteRuleEvaluationsInner.fromJson(json);
  }

  final RuleSuiteRuleEvaluationsInnerRuleSource? ruleSource;

  /// The enforcement level of this rule source.
  final RuleSuiteRuleEvaluationsInnerEnforcement? enforcement;

  /// The result of the evaluation of the individual rule.
  final RuleSuiteRuleEvaluationsInnerResult? result;

  /// The type of rule.
  final String? ruleType;

  /// The detailed failure message for the rule. Null if the rule passed.
  final String? details;

  /// Converts a [RuleSuiteRuleEvaluationsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (ruleSource != null) 'rule_source': ruleSource?.toJson(),
      if (enforcement != null) 'enforcement': enforcement?.toJson(),
      if (result != null) 'result': result?.toJson(),
      if (ruleType != null) 'rule_type': ruleType,
      'details': details,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([ruleSource, enforcement, result, ruleType, details]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RuleSuiteRuleEvaluationsInner &&
        ruleSource == other.ruleSource &&
        enforcement == other.enforcement &&
        result == other.result &&
        ruleType == other.ruleType &&
        details == other.details;
  }
}
