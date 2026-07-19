/// The level at which the comment is targeted, can be a diff line or a file.
enum PullRequestReviewCommentSubjectType {
  line._('line'),
  file._('file');

  const PullRequestReviewCommentSubjectType._(this.value);

  /// Creates a PullRequestReviewCommentSubjectType from a json value.
  factory PullRequestReviewCommentSubjectType.fromJson(String json) {
    return PullRequestReviewCommentSubjectType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullRequestReviewCommentSubjectType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullRequestReviewCommentSubjectType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewCommentSubjectType.fromJson(json);
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
