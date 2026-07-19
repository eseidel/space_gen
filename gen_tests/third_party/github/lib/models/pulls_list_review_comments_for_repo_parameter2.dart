enum PullsListReviewCommentsForRepoParameter2 {
  created._('created'),
  updated._('updated'),
  createdAt._('created_at');

  const PullsListReviewCommentsForRepoParameter2._(this.value);

  /// Creates a PullsListReviewCommentsForRepoParameter2 from a json value.
  factory PullsListReviewCommentsForRepoParameter2.fromJson(String json) {
    return PullsListReviewCommentsForRepoParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsListReviewCommentsForRepoParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListReviewCommentsForRepoParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListReviewCommentsForRepoParameter2.fromJson(json);
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
