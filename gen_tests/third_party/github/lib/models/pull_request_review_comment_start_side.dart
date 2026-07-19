/// The side of the first line of the range for a multi-line comment.
enum PullRequestReviewCommentStartSide {
  left._('LEFT'),
  right._('RIGHT');

  const PullRequestReviewCommentStartSide._(this.value);

  /// Creates a PullRequestReviewCommentStartSide from a json value.
  factory PullRequestReviewCommentStartSide.fromJson(String json) {
    return PullRequestReviewCommentStartSide.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullRequestReviewCommentStartSide value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentStartSide? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentStartSide.fromJson(json);
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
