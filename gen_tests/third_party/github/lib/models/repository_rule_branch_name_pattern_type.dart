enum RepositoryRuleBranchNamePatternType {
  branchNamePattern._('branch_name_pattern');

  const RepositoryRuleBranchNamePatternType._(this.value);

  /// Creates a RepositoryRuleBranchNamePatternType from a json value.
  factory RepositoryRuleBranchNamePatternType.fromJson(String json) {
    return RepositoryRuleBranchNamePatternType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleBranchNamePatternType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleBranchNamePatternType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleBranchNamePatternType.fromJson(json);
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
