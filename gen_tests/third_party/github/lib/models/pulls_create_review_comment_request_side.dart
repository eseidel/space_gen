// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// In a split diff view, the side of the diff that the pull request's changes
/// appear on. Can be `LEFT` or `RIGHT`. Use `LEFT` for deletions that appear in
/// red. Use `RIGHT` for additions that appear in green or unchanged lines that
/// appear in white and are shown for context. For a multi-line comment, side
/// represents whether the last line of the comment range is a deletion or
/// addition. For more information, see "[Diff view
/// options](https://docs.github.com/articles/about-comparing-branches-in-pull-requests#diff-view-options)"
/// in the GitHub Help documentation.
enum PullsCreateReviewCommentRequestSide {
  left._('LEFT'),
  right._('RIGHT');

  const PullsCreateReviewCommentRequestSide._(this.value);

  /// Creates a PullsCreateReviewCommentRequestSide from a json value.
  factory PullsCreateReviewCommentRequestSide.fromJson(String json) {
    return PullsCreateReviewCommentRequestSide.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsCreateReviewCommentRequestSide value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsCreateReviewCommentRequestSide? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewCommentRequestSide.fromJson(json);
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
