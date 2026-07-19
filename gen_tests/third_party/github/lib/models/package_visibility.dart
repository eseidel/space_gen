/// Example: `'private'`
enum PackageVisibility {
  private._('private'),
  public._('public');

  const PackageVisibility._(this.value);

  /// Creates a PackageVisibility from a json value.
  factory PackageVisibility.fromJson(String json) {
    return PackageVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PackageVisibility value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackageVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PackageVisibility.fromJson(json);
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
