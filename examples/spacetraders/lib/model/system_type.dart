enum SystemType {
  neutronStar('NEUTRON_STAR'),
  redStar('RED_STAR'),
  orangeStar('ORANGE_STAR'),
  blueStar('BLUE_STAR'),
  youngStar('YOUNG_STAR'),
  whiteDwarf('WHITE_DWARF'),
  blackHole('BLACK_HOLE'),
  hypergiant('HYPERGIANT'),
  nebula('NEBULA'),
  unstable('UNSTABLE'),
  ;

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
