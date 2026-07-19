// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_ruleset_conditions_repository_property_spec.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty {
  const RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty({
    this.include,
    this.exclude,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty].
  factory RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty',
      json,
      () => RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty(
        include: (json['include'] as List?)
            ?.map<RepositoryRulesetConditionsRepositoryPropertySpec>(
              (e) => RepositoryRulesetConditionsRepositoryPropertySpec.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        exclude: (json['exclude'] as List?)
            ?.map<RepositoryRulesetConditionsRepositoryPropertySpec>(
              (e) => RepositoryRulesetConditionsRepositoryPropertySpec.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty.fromJson(
      json,
    );
  }

  /// The repository properties and values to include. All of these properties
  /// must match for the condition to pass.
  final List<RepositoryRulesetConditionsRepositoryPropertySpec>? include;

  /// The repository properties and values to exclude. The condition will not
  /// pass if any of these properties match.
  final List<RepositoryRulesetConditionsRepositoryPropertySpec>? exclude;

  /// Converts a [RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'include': ?include?.map((e) => e.toJson()).toList(),
      'exclude': ?exclude?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(include), listHash(exclude)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty &&
        listsEqual(include, other.include) &&
        listsEqual(exclude, other.exclude);
  }
}
