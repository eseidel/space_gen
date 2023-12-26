enum SupplyLevel {
  scarce('SCARCE'),
  limited('LIMITED'),
  moderate('MODERATE'),
  high('HIGH'),
  abundant('ABUNDANT'),
  ;

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
