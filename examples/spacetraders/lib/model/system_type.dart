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
      orElse: () => throw Exception('Unknown SystemType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
