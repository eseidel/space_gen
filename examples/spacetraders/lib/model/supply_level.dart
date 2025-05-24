enum SupplyLevel {
  SCARCE._('SCARCE'),
  LIMITED._('LIMITED'),
  MODERATE._('MODERATE'),
  HIGH._('HIGH'),
  ABUNDANT._('ABUNDANT');

  const SupplyLevel._(this.value);

  factory SupplyLevel.fromJson(String json) {
    return SupplyLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown SupplyLevel value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
