enum ContractType {
  PROCUREMENT._('PROCUREMENT'),
  TRANSPORT._('TRANSPORT'),
  SHUTTLE._('SHUTTLE');

  const ContractType._(this.value);

  factory ContractType.fromJson(String json) {
    return ContractType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ContractType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
