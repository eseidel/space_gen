enum WaypointModifierSymbol {
  STRIPPED('STRIPPED'),
  UNSTABLE('UNSTABLE'),
  RADIATION_LEAK('RADIATION_LEAK'),
  CRITICAL_LIMIT('CRITICAL_LIMIT'),
  CIVIL_UNREST('CIVIL_UNREST');

  const WaypointModifierSymbol(this.value);

  factory WaypointModifierSymbol.fromJson(String json) {
    return WaypointModifierSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw Exception('Unknown WaypointModifierSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
