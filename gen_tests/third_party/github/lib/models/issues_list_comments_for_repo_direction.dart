enum IssuesListCommentsForRepoDirection {
  asc._('asc'),
  desc._('desc');

  const IssuesListCommentsForRepoDirection._(this.value);

  /// Creates a IssuesListCommentsForRepoDirection from a json value.
  factory IssuesListCommentsForRepoDirection.fromJson(String json) {
    return IssuesListCommentsForRepoDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListCommentsForRepoDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListCommentsForRepoDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListCommentsForRepoDirection.fromJson(json);
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
