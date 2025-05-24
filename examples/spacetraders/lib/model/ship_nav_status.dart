enum ShipNavStatus {
  IN_TRANSIT._('IN_TRANSIT'),
  IN_ORBIT._('IN_ORBIT'),
  DOCKED._('DOCKED');

  const ShipNavStatus._(this.value);

  factory ShipNavStatus.fromJson(String json) {
    return ShipNavStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipNavStatus value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
