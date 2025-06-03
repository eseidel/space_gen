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
      orElse: () =>
          throw FormatException('Unknown WaypointModifierSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointModifierSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WaypointModifierSymbol.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
