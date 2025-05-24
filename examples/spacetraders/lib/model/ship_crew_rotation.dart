enum ShipCrewRotation {
  STRICT._('STRICT'),
  RELAXED._('RELAXED');

  const ShipCrewRotation._(this.value);

  factory ShipCrewRotation.fromJson(String json) {
    return ShipCrewRotation.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipCrewRotation value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
