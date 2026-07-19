enum RepositoryRuleWorkflowsType {
  workflows._('workflows');

  const RepositoryRuleWorkflowsType._(this.value);

  /// Creates a RepositoryRuleWorkflowsType from a json value.
  factory RepositoryRuleWorkflowsType.fromJson(String json) {
    return RepositoryRuleWorkflowsType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleWorkflowsType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleWorkflowsType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleWorkflowsType.fromJson(json);
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
