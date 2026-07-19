import 'package:github/model_helpers.dart';
import 'package:github/models/org_private_registry_configuration.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateRegistriesListOrgPrivateRegistries200Response {
  const PrivateRegistriesListOrgPrivateRegistries200Response({
    required this.totalCount,
    required this.configurations,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PrivateRegistriesListOrgPrivateRegistries200Response].
  factory PrivateRegistriesListOrgPrivateRegistries200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PrivateRegistriesListOrgPrivateRegistries200Response',
      json,
      () => PrivateRegistriesListOrgPrivateRegistries200Response(
        totalCount: json['total_count'] as int,
        configurations: (json['configurations'] as List)
            .map<OrgPrivateRegistryConfiguration>(
              (e) => OrgPrivateRegistryConfiguration.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateRegistriesListOrgPrivateRegistries200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PrivateRegistriesListOrgPrivateRegistries200Response.fromJson(json);
  }

  final int totalCount;
  final List<OrgPrivateRegistryConfiguration> configurations;

  /// Converts a [PrivateRegistriesListOrgPrivateRegistries200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'configurations': configurations.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(configurations)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateRegistriesListOrgPrivateRegistries200Response &&
        totalCount == other.totalCount &&
        listsEqual(configurations, other.configurations);
  }
}
