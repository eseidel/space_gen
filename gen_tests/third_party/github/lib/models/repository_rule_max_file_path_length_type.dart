enum RepositoryRuleMaxFilePathLengthType {
  maxFilePathLength._('max_file_path_length');

  const RepositoryRuleMaxFilePathLengthType._(this.value);

  /// Creates a RepositoryRuleMaxFilePathLengthType from a json value.
  factory RepositoryRuleMaxFilePathLengthType.fromJson(String json) {
    return RepositoryRuleMaxFilePathLengthType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleMaxFilePathLengthType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleMaxFilePathLengthType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMaxFilePathLengthType.fromJson(json);
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
