enum PackagesListPackagesForUserPackageType {
  npm._('npm'),
  maven._('maven'),
  rubygems._('rubygems'),
  docker._('docker'),
  nuget._('nuget'),
  container._('container');

  const PackagesListPackagesForUserPackageType._(this.value);

  /// Creates a PackagesListPackagesForUserPackageType from a json value.
  factory PackagesListPackagesForUserPackageType.fromJson(String json) {
    return PackagesListPackagesForUserPackageType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PackagesListPackagesForUserPackageType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackagesListPackagesForUserPackageType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PackagesListPackagesForUserPackageType.fromJson(json);
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
