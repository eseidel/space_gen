import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RuleSuiteRuleEvaluationsInnerRuleSource {
  const RuleSuiteRuleEvaluationsInnerRuleSource({
    this.type,
    this.id,
    this.name,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RuleSuiteRuleEvaluationsInnerRuleSource].
  factory RuleSuiteRuleEvaluationsInnerRuleSource.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RuleSuiteRuleEvaluationsInnerRuleSource',
      json,
      () => RuleSuiteRuleEvaluationsInnerRuleSource(
        type: json['type'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RuleSuiteRuleEvaluationsInnerRuleSource? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RuleSuiteRuleEvaluationsInnerRuleSource.fromJson(json);
  }

  /// The type of rule source.
  final String? type;

  /// The ID of the rule source.
  final int? id;

  /// The name of the rule source.
  final String? name;

  /// Converts a [RuleSuiteRuleEvaluationsInnerRuleSource]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': ?type, 'id': id, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([type, id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RuleSuiteRuleEvaluationsInnerRuleSource &&
        type == other.type &&
        id == other.id &&
        name == other.name;
  }
}
