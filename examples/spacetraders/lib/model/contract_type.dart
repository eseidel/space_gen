enum ContractType {
  PROCUREMENT('PROCUREMENT'),
  TRANSPORT('TRANSPORT'),
  SHUTTLE('SHUTTLE');

  const ContractType(this.value);

  factory ContractType.fromJson(String json) {
    return ContractType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ContractType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
