enum PackagesListPackagesForUserParameter0 {
  npm._('npm'),
  maven._('maven'),
  rubygems._('rubygems'),
  docker._('docker'),
  nuget._('nuget'),
  container._('container');

  const PackagesListPackagesForUserParameter0._(this.value);

  /// Creates a PackagesListPackagesForUserParameter0 from a json value.
  factory PackagesListPackagesForUserParameter0.fromJson(String json) {
    return PackagesListPackagesForUserParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PackagesListPackagesForUserParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackagesListPackagesForUserParameter0? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PackagesListPackagesForUserParameter0.fromJson(json);
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
