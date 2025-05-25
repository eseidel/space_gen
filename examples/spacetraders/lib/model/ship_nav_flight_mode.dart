enum ShipNavFlightMode {
  DRIFT._('DRIFT'),
  STEALTH._('STEALTH'),
  CRUISE._('CRUISE'),
  BURN._('BURN');

  const ShipNavFlightMode._(this.value);

  factory ShipNavFlightMode.fromJson(String json) {
    return ShipNavFlightMode.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw FormatException('Unknown ShipNavFlightMode value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipNavFlightMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipNavFlightMode.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
