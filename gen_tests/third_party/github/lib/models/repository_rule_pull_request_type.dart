enum RepositoryRulePullRequestType {
  pullRequest._('pull_request');

  const RepositoryRulePullRequestType._(this.value);

  /// Creates a RepositoryRulePullRequestType from a json value.
  factory RepositoryRulePullRequestType.fromJson(String json) {
    return RepositoryRulePullRequestType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRulePullRequestType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRulePullRequestType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulePullRequestType.fromJson(json);
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
