/// The ship's set speed when traveling between waypoints or systems.
enum ShipNavFlightMode {
  drift._('DRIFT'),
  stealth._('STEALTH'),
  cruise._('CRUISE'),
  burn._('BURN');

  const ShipNavFlightMode._(this.value);

  /// Creates a ShipNavFlightMode from a json value.
  factory ShipNavFlightMode.fromJson(String json) {
    return ShipNavFlightMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipNavFlightMode value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipNavFlightMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipNavFlightMode.fromJson(json);
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
