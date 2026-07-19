/// Which type of organization repositories have access to the private registry.
enum OrgPrivateRegistryConfigurationVisibility {
  all._('all'),
  private._('private'),
  selected._('selected');

  const OrgPrivateRegistryConfigurationVisibility._(this.value);

  /// Creates a OrgPrivateRegistryConfigurationVisibility from a json value.
  factory OrgPrivateRegistryConfigurationVisibility.fromJson(String json) {
    return OrgPrivateRegistryConfigurationVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgPrivateRegistryConfigurationVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgPrivateRegistryConfigurationVisibility? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgPrivateRegistryConfigurationVisibility.fromJson(json);
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
