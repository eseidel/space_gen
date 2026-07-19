// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// **Required when using multi-line comments unless using `in_reply_to`**. The
/// `start_side` is the starting side of the diff that the comment applies to.
/// Can be `LEFT` or `RIGHT`. To learn more about multi-line comments, see
/// "[Commenting on a pull
/// request](https://docs.github.com/articles/commenting-on-a-pull-request#adding-line-comments-to-a-pull-request)"
/// in the GitHub Help documentation. See `side` in this table for additional
/// context.
enum PullsCreateReviewCommentRequestStartSide {
  left._('LEFT'),
  right._('RIGHT'),
  side._('side');

  const PullsCreateReviewCommentRequestStartSide._(this.value);

  /// Creates a PullsCreateReviewCommentRequestStartSide from a json value.
  factory PullsCreateReviewCommentRequestStartSide.fromJson(String json) {
    return PullsCreateReviewCommentRequestStartSide.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsCreateReviewCommentRequestStartSide value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsCreateReviewCommentRequestStartSide? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewCommentRequestStartSide.fromJson(json);
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
