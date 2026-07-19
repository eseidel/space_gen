enum RepositoryRuleRequiredStatusChecksType {
  requiredStatusChecks._('required_status_checks');

  const RepositoryRuleRequiredStatusChecksType._(this.value);

  /// Creates a RepositoryRuleRequiredStatusChecksType from a json value.
  factory RepositoryRuleRequiredStatusChecksType.fromJson(String json) {
    return RepositoryRuleRequiredStatusChecksType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleRequiredStatusChecksType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredStatusChecksType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredStatusChecksType.fromJson(json);
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
