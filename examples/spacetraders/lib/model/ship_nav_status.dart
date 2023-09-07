enum ShipNavStatus {
  inTransit('IN_TRANSIT'),
  inOrbit('IN_ORBIT'),
  docked('DOCKED'),
  ;

  const ShipNavStatus(this.value);

  factory ShipNavStatus.fromJson(String json) {
    return ShipNavStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipNavStatus value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
