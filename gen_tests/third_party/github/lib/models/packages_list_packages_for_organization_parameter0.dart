enum PackagesListPackagesForOrganizationParameter0 {
  npm._('npm'),
  maven._('maven'),
  rubygems._('rubygems'),
  docker._('docker'),
  nuget._('nuget'),
  container._('container');

  const PackagesListPackagesForOrganizationParameter0._(this.value);

  /// Creates a PackagesListPackagesForOrganizationParameter0 from a json value.
  factory PackagesListPackagesForOrganizationParameter0.fromJson(String json) {
    return PackagesListPackagesForOrganizationParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PackagesListPackagesForOrganizationParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackagesListPackagesForOrganizationParameter0? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return PackagesListPackagesForOrganizationParameter0.fromJson(json);
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
