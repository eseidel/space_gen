import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property_value.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest {
  const OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest({
    required this.repositoryNames,
    required this.properties,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest].
  factory OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest',
      json,
      () => OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest(
        repositoryNames: (json['repository_names'] as List).cast<String>(),
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
  static OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest.fromJson(
      json,
    );
  }

  /// The names of repositories that the custom property values will be
  /// applied to.
  final List<String> repositoryNames;

  /// List of custom property names and associated values to apply to the
  /// repositories.
  final List<CustomPropertyValue> properties;

  /// Converts an [OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repository_names': repositoryNames,
      'properties': properties.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(repositoryNames), listHash(properties)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest &&
        listsEqual(repositoryNames, other.repositoryNames) &&
        listsEqual(properties, other.properties);
  }
}
