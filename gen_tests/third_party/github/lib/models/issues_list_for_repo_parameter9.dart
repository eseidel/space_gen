enum IssuesListForRepoParameter9 {
  created._('created'),
  updated._('updated'),
  comments._('comments');

  const IssuesListForRepoParameter9._(this.value);

  /// Creates a IssuesListForRepoParameter9 from a json value.
  factory IssuesListForRepoParameter9.fromJson(String json) {
    return IssuesListForRepoParameter9.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForRepoParameter9 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForRepoParameter9? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForRepoParameter9.fromJson(json);
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
