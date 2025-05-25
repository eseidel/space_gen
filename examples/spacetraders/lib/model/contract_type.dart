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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContractType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ContractType.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
