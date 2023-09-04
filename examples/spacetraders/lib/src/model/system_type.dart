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
    switch (json) {
      case 'NEUTRON_STAR':
        return SystemType.neutronStar;
      case 'RED_STAR':
        return SystemType.redStar;
      case 'ORANGE_STAR':
        return SystemType.orangeStar;
      case 'BLUE_STAR':
        return SystemType.blueStar;
      case 'YOUNG_STAR':
        return SystemType.youngStar;
      case 'WHITE_DWARF':
        return SystemType.whiteDwarf;
      case 'BLACK_HOLE':
        return SystemType.blackHole;
      case 'HYPERGIANT':
        return SystemType.hypergiant;
      case 'NEBULA':
        return SystemType.nebula;
      case 'UNSTABLE':
        return SystemType.unstable;
      default:
        throw Exception('Unknown SystemType value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case SystemType.neutronStar:
        return 'NEUTRON_STAR';
      case SystemType.redStar:
        return 'RED_STAR';
      case SystemType.orangeStar:
        return 'ORANGE_STAR';
      case SystemType.blueStar:
        return 'BLUE_STAR';
      case SystemType.youngStar:
        return 'YOUNG_STAR';
      case SystemType.whiteDwarf:
        return 'WHITE_DWARF';
      case SystemType.blackHole:
        return 'BLACK_HOLE';
      case SystemType.hypergiant:
        return 'HYPERGIANT';
      case SystemType.nebula:
        return 'NEBULA';
      case SystemType.unstable:
        return 'UNSTABLE';
    }
  }
}
