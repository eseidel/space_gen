// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The registry type.
enum OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType {
  mavenRepository._('maven_repository'),
  nugetFeed._('nuget_feed'),
  goproxyServer._('goproxy_server');

  const OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType._(
    this.value,
  );

  /// Creates a OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType from a json value.
  factory OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType.fromJson(
    String json,
  ) {
    return OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgPrivateRegistryConfigurationWithSelectedRepositoriesRegistryType.fromJson(
      json,
    );
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
