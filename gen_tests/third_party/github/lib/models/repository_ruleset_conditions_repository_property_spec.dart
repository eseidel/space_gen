// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_ruleset_conditions_repository_property_spec_source.dart';
import 'package:meta/meta.dart';

/// {@template repository_ruleset_conditions_repository_property_spec}
/// Repository ruleset property targeting definition
/// Parameters for a targeting a repository property
/// {@endtemplate}
@immutable
class RepositoryRulesetConditionsRepositoryPropertySpec {
  /// {@macro repository_ruleset_conditions_repository_property_spec}
  const RepositoryRulesetConditionsRepositoryPropertySpec({
    required this.name,
    required this.propertyValues,
    this.source,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRulesetConditionsRepositoryPropertySpec].
  factory RepositoryRulesetConditionsRepositoryPropertySpec.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRulesetConditionsRepositoryPropertySpec',
      json,
      () => RepositoryRulesetConditionsRepositoryPropertySpec(
        name: json['name'] as String,
        propertyValues: (json['property_values'] as List).cast<String>(),
        source:
            RepositoryRulesetConditionsRepositoryPropertySpecSource.maybeFromJson(
              json['source'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditionsRepositoryPropertySpec? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditionsRepositoryPropertySpec.fromJson(json);
  }

  /// The name of the repository property to target
  final String name;

  /// The values to match for the repository property
  final List<String> propertyValues;

  /// The source of the repository property. Defaults to 'custom' if not
  /// specified.
  final RepositoryRulesetConditionsRepositoryPropertySpecSource? source;

  /// Converts a [RepositoryRulesetConditionsRepositoryPropertySpec]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'property_values': propertyValues,
      'source': ?source?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(propertyValues), source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulesetConditionsRepositoryPropertySpec &&
        name == other.name &&
        listsEqual(propertyValues, other.propertyValues) &&
        source == other.source;
  }
}
