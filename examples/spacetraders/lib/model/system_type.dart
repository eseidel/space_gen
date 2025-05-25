enum SystemType {
  NEUTRON_STAR._('NEUTRON_STAR'),
  RED_STAR._('RED_STAR'),
  ORANGE_STAR._('ORANGE_STAR'),
  BLUE_STAR._('BLUE_STAR'),
  YOUNG_STAR._('YOUNG_STAR'),
  WHITE_DWARF._('WHITE_DWARF'),
  BLACK_HOLE._('BLACK_HOLE'),
  HYPERGIANT._('HYPERGIANT'),
  NEBULA._('NEBULA'),
  UNSTABLE._('UNSTABLE');

  const SystemType._(this.value);

  factory SystemType.fromJson(String json) {
    return SystemType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown SystemType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SystemType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SystemType.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
