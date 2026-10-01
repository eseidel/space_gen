// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Waypoint Modifier Symbol
/// The unique identifier of the modifier.
enum WaypointModifierSymbol {
  stripped._('STRIPPED'),
  unstable._('UNSTABLE'),
  radiationLeak._('RADIATION_LEAK'),
  criticalLimit._('CRITICAL_LIMIT'),
  civilUnrest._('CIVIL_UNREST');

  const WaypointModifierSymbol._(this.value);

  /// Creates a WaypointModifierSymbol from a json value.
  factory WaypointModifierSymbol.fromJson(String json) {
    return WaypointModifierSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown WaypointModifierSymbol value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static WaypointModifierSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WaypointModifierSymbol.fromJson(json);
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
