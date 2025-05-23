enum SupplyLevel {
  SCARCE('SCARCE'),
  LIMITED('LIMITED'),
  MODERATE('MODERATE'),
  HIGH('HIGH'),
  ABUNDANT('ABUNDANT');

  const SupplyLevel(this.value);

  factory SupplyLevel.fromJson(String json) {
    return SupplyLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown SupplyLevel value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
