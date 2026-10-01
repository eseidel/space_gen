// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Example: `'docker'`
enum PackagePackageType {
  npm._('npm'),
  maven._('maven'),
  rubygems._('rubygems'),
  docker._('docker'),
  nuget._('nuget'),
  container._('container');

  const PackagePackageType._(this.value);

  /// Creates a PackagePackageType from a json value.
  factory PackagePackageType.fromJson(String json) {
    return PackagePackageType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PackagePackageType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackagePackageType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PackagePackageType.fromJson(json);
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
