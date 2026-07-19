enum RepositoryRuleCodeScanningType {
  codeScanning._('code_scanning');

  const RepositoryRuleCodeScanningType._(this.value);

  /// Creates a RepositoryRuleCodeScanningType from a json value.
  factory RepositoryRuleCodeScanningType.fromJson(String json) {
    return RepositoryRuleCodeScanningType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleCodeScanningType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleCodeScanningType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCodeScanningType.fromJson(json);
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
