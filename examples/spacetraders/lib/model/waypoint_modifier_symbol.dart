enum WaypointModifierSymbol {
  STRIPPED._('STRIPPED'),
  UNSTABLE._('UNSTABLE'),
  RADIATION_LEAK._('RADIATION_LEAK'),
  CRITICAL_LIMIT._('CRITICAL_LIMIT'),
  CIVIL_UNREST._('CIVIL_UNREST');

  const WaypointModifierSymbol._(this.value);

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
