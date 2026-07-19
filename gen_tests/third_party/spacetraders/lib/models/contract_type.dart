/// Type of contract.
enum ContractType {
  procurement._('PROCUREMENT'),
  transport._('TRANSPORT'),
  shuttle._('SHUTTLE');

  const ContractType._(this.value);

  /// Creates a ContractType from a json value.
  factory ContractType.fromJson(String json) {
    return ContractType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ContractType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ContractType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ContractType.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
