enum PackageVisibilityParam {
  public._('public'),
  private._('private'),
  internal._('internal');

  const PackageVisibilityParam._(this.value);

  /// Creates a PackageVisibilityParam from a json value.
  factory PackageVisibilityParam.fromJson(String json) {
    return PackageVisibilityParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PackageVisibilityParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PackageVisibilityParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PackageVisibilityParam.fromJson(json);
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
