enum RepositoryRuleDeletionType {
  deletion._('deletion');

  const RepositoryRuleDeletionType._(this.value);

  /// Creates a RepositoryRuleDeletionType from a json value.
  factory RepositoryRuleDeletionType.fromJson(String json) {
    return RepositoryRuleDeletionType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleDeletionType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleDeletionType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDeletionType.fromJson(json);
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
