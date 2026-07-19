enum PullsListReviewCommentsForRepoParameter3 {
  asc._('asc'),
  desc._('desc');

  const PullsListReviewCommentsForRepoParameter3._(this.value);

  /// Creates a PullsListReviewCommentsForRepoParameter3 from a json value.
  factory PullsListReviewCommentsForRepoParameter3.fromJson(String json) {
    return PullsListReviewCommentsForRepoParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsListReviewCommentsForRepoParameter3 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListReviewCommentsForRepoParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListReviewCommentsForRepoParameter3.fromJson(json);
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
