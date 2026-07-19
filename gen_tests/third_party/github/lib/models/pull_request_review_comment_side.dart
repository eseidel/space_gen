/// The side of the diff to which the comment applies. The side of the last line
/// of the range for a multi-line comment
enum PullRequestReviewCommentSide {
  left._('LEFT'),
  right._('RIGHT');

  const PullRequestReviewCommentSide._(this.value);

  /// Creates a PullRequestReviewCommentSide from a json value.
  factory PullRequestReviewCommentSide.fromJson(String json) {
    return PullRequestReviewCommentSide.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullRequestReviewCommentSide value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentSide? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentSide.fromJson(json);
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
