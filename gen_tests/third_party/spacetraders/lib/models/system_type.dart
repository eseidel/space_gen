/// The type of system.
enum SystemType {
  neutronStar._('NEUTRON_STAR'),
  redStar._('RED_STAR'),
  orangeStar._('ORANGE_STAR'),
  blueStar._('BLUE_STAR'),
  youngStar._('YOUNG_STAR'),
  whiteDwarf._('WHITE_DWARF'),
  blackHole._('BLACK_HOLE'),
  hypergiant._('HYPERGIANT'),
  nebula._('NEBULA'),
  unstable._('UNSTABLE');

  const SystemType._(this.value);

  /// Creates a SystemType from a json value.
  factory SystemType.fromJson(String json) {
    return SystemType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown SystemType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SystemType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SystemType.fromJson(json);
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
