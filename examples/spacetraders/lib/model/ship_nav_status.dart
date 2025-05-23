enum ShipNavStatus {
  IN_TRANSIT('IN_TRANSIT'),
  IN_ORBIT('IN_ORBIT'),
  DOCKED('DOCKED');

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
