enum ShipNavFlightMode {
  drift('DRIFT'),
  stealth('STEALTH'),
  cruise('CRUISE'),
  burn('BURN');

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
