// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The review action you want to perform. The review actions include:
/// `APPROVE`, `REQUEST_CHANGES`, or `COMMENT`. By leaving this blank, you set
/// the review action state to `PENDING`, which means you will need to [submit
/// the pull request
/// review](https://docs.github.com/rest/pulls/reviews#submit-a-review-for-a-pull-request)
/// when you are ready.
enum PullsCreateReviewRequestEvent {
  approve._('APPROVE'),
  requestChanges._('REQUEST_CHANGES'),
  comment._('COMMENT');

  const PullsCreateReviewRequestEvent._(this.value);

  /// Creates a PullsCreateReviewRequestEvent from a json value.
  factory PullsCreateReviewRequestEvent.fromJson(String json) {
    return PullsCreateReviewRequestEvent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsCreateReviewRequestEvent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsCreateReviewRequestEvent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewRequestEvent.fromJson(json);
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
