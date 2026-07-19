// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4 {
  active._('active'),
  deleted._('deleted');

  const PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4._(
    this.value,
  );

  /// Creates a PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4 from a json value.
  factory PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4.fromJson(
    String json,
  ) {
    return PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4 value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4.fromJson(
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
