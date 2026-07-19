import 'package:github/model_helpers.dart';
import 'package:github/models/repository_ruleset_conditions_ref_name.dart';
import 'package:meta/meta.dart';

/// {@template repository_ruleset_conditions}
/// Repository ruleset conditions for ref names
/// Parameters for a repository ruleset ref name condition
/// {@endtemplate}
@immutable
class RepositoryRulesetConditions {
  /// {@macro repository_ruleset_conditions}
  const RepositoryRulesetConditions({this.refName});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRulesetConditions].
  factory RepositoryRulesetConditions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRulesetConditions',
      json,
      () => RepositoryRulesetConditions(
        refName: RepositoryRulesetConditionsRefName.maybeFromJson(
          json['ref_name'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditions.fromJson(json);
  }

  final RepositoryRulesetConditionsRefName? refName;

  /// Converts a [RepositoryRulesetConditions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ref_name': ?refName?.toJson()};
  }

  @override
  int get hashCode => refName.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulesetConditions && refName == other.refName;
  }
}
