enum RepositoryRuleRequiredLinearHistoryType {
  requiredLinearHistory._('required_linear_history');

  const RepositoryRuleRequiredLinearHistoryType._(this.value);

  /// Creates a RepositoryRuleRequiredLinearHistoryType from a json value.
  factory RepositoryRuleRequiredLinearHistoryType.fromJson(String json) {
    return RepositoryRuleRequiredLinearHistoryType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleRequiredLinearHistoryType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredLinearHistoryType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredLinearHistoryType.fromJson(json);
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
