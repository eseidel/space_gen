/// The level at which the comment is targeted.
enum PullsCreateReviewCommentRequestSubjectType {
  line._('line'),
  file._('file');

  const PullsCreateReviewCommentRequestSubjectType._(this.value);

  /// Creates a PullsCreateReviewCommentRequestSubjectType from a json value.
  factory PullsCreateReviewCommentRequestSubjectType.fromJson(String json) {
    return PullsCreateReviewCommentRequestSubjectType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsCreateReviewCommentRequestSubjectType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsCreateReviewCommentRequestSubjectType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewCommentRequestSubjectType.fromJson(json);
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
