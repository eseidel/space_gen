enum ShipNavFlightMode {
  DRIFT._('DRIFT'),
  STEALTH._('STEALTH'),
  CRUISE._('CRUISE'),
  BURN._('BURN');

  const ShipNavFlightMode._(this.value);

  factory ShipNavFlightMode.fromJson(String json) {
    return ShipNavFlightMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipNavFlightMode value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
