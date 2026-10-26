enum PullsListReviewCommentsForRepoSort {
  created._('created'),
  updated._('updated'),
  createdAt._('created_at');

  const PullsListReviewCommentsForRepoSort._(this.value);

  /// Creates a PullsListReviewCommentsForRepoSort from a json value.
  factory PullsListReviewCommentsForRepoSort.fromJson(String json) {
    return PullsListReviewCommentsForRepoSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsListReviewCommentsForRepoSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListReviewCommentsForRepoSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListReviewCommentsForRepoSort.fromJson(json);
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
