enum PullsListReviewCommentsForRepoDirection {
  asc._('asc'),
  desc._('desc');

  const PullsListReviewCommentsForRepoDirection._(this.value);

  /// Creates a PullsListReviewCommentsForRepoDirection from a json value.
  factory PullsListReviewCommentsForRepoDirection.fromJson(String json) {
    return PullsListReviewCommentsForRepoDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsListReviewCommentsForRepoDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListReviewCommentsForRepoDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListReviewCommentsForRepoDirection.fromJson(json);
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
