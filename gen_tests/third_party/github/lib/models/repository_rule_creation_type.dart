enum RepositoryRuleCreationType {
  creation._('creation');

  const RepositoryRuleCreationType._(this.value);

  /// Creates a RepositoryRuleCreationType from a json value.
  factory RepositoryRuleCreationType.fromJson(String json) {
    return RepositoryRuleCreationType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleCreationType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleCreationType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCreationType.fromJson(json);
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
