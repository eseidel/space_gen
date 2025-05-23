enum ShipNavFlightMode {
  DRIFT('DRIFT'),
  STEALTH('STEALTH'),
  CRUISE('CRUISE'),
  BURN('BURN');

  const ShipNavFlightMode(this.value);

  factory ShipNavFlightMode.fromJson(String json) {
    return ShipNavFlightMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipNavFlightMode value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
