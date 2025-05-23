enum SystemType {
  NEUTRON_STAR('NEUTRON_STAR'),
  RED_STAR('RED_STAR'),
  ORANGE_STAR('ORANGE_STAR'),
  BLUE_STAR('BLUE_STAR'),
  YOUNG_STAR('YOUNG_STAR'),
  WHITE_DWARF('WHITE_DWARF'),
  BLACK_HOLE('BLACK_HOLE'),
  HYPERGIANT('HYPERGIANT'),
  NEBULA('NEBULA'),
  UNSTABLE('UNSTABLE');

  const SystemType(this.value);

  factory SystemType.fromJson(String json) {
    return SystemType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown SystemType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
