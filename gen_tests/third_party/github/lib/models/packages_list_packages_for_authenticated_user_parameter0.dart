// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum PackagesListPackagesForAuthenticatedUserParameter0 {
  npm._('npm'),
  maven._('maven'),
  rubygems._('rubygems'),
  docker._('docker'),
  nuget._('nuget'),
  container._('container');

  const PackagesListPackagesForAuthenticatedUserParameter0._(this.value);

  /// Creates a PackagesListPackagesForAuthenticatedUserParameter0 from a json value.
  factory PackagesListPackagesForAuthenticatedUserParameter0.fromJson(
    String json,
  ) {
    return PackagesListPackagesForAuthenticatedUserParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PackagesListPackagesForAuthenticatedUserParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackagesListPackagesForAuthenticatedUserParameter0? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return PackagesListPackagesForAuthenticatedUserParameter0.fromJson(json);
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
