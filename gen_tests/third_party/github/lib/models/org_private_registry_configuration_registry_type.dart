/// The registry type.
enum OrgPrivateRegistryConfigurationRegistryType {
  mavenRepository._('maven_repository'),
  nugetFeed._('nuget_feed'),
  goproxyServer._('goproxy_server');

  const OrgPrivateRegistryConfigurationRegistryType._(this.value);

  /// Creates a OrgPrivateRegistryConfigurationRegistryType from a json value.
  factory OrgPrivateRegistryConfigurationRegistryType.fromJson(String json) {
    return OrgPrivateRegistryConfigurationRegistryType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgPrivateRegistryConfigurationRegistryType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgPrivateRegistryConfigurationRegistryType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgPrivateRegistryConfigurationRegistryType.fromJson(json);
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
