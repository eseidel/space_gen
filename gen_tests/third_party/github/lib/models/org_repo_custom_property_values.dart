import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property_value.dart';
import 'package:meta/meta.dart';

/// {@template org_repo_custom_property_values}
/// Organization Repository Custom Property Values
/// List of custom property values for a repository
/// {@endtemplate}
@immutable
class OrgRepoCustomPropertyValues {
  /// {@macro org_repo_custom_property_values}
  const OrgRepoCustomPropertyValues({
    required this.repositoryId,
    required this.repositoryName,
    required this.repositoryFullName,
    required this.properties,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgRepoCustomPropertyValues].
  factory OrgRepoCustomPropertyValues.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgRepoCustomPropertyValues',
      json,
      () => OrgRepoCustomPropertyValues(
        repositoryId: json['repository_id'] as int,
        repositoryName: json['repository_name'] as String,
        repositoryFullName: json['repository_full_name'] as String,
        properties: (json['properties'] as List)
            .map<CustomPropertyValue>(
              (e) => CustomPropertyValue.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgRepoCustomPropertyValues? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgRepoCustomPropertyValues.fromJson(json);
  }

  /// Example: `1296269`
  final int repositoryId;

  /// Example: `'Hello-World'`
  final String repositoryName;

  /// Example: `'octocat/Hello-World'`
  final String repositoryFullName;

  /// List of custom property names and associated values
  final List<CustomPropertyValue> properties;

  /// Converts an [OrgRepoCustomPropertyValues] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repository_id': repositoryId,
      'repository_name': repositoryName,
      'repository_full_name': repositoryFullName,
      'properties': properties.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    repositoryId,
    repositoryName,
    repositoryFullName,
    listHash(properties),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgRepoCustomPropertyValues &&
        repositoryId == other.repositoryId &&
        repositoryName == other.repositoryName &&
        repositoryFullName == other.repositoryFullName &&
        listsEqual(properties, other.properties);
  }
}
