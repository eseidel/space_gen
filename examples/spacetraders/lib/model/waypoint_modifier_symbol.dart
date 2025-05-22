enum WaypointModifierSymbol {
  stripped('STRIPPED'),
  unstable('UNSTABLE'),
  radiationLeak('RADIATION_LEAK'),
  criticalLimit('CRITICAL_LIMIT'),
  civilUnrest('CIVIL_UNREST');

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
