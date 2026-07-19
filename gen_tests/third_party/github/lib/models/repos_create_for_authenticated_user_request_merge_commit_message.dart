// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The default value for a merge commit message.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `PR_BODY` - default to the pull request's body.
/// - `BLANK` - default to a blank commit message.
enum ReposCreateForAuthenticatedUserRequestMergeCommitMessage {
  prBody._('PR_BODY'),
  prTitle._('PR_TITLE'),
  blank._('BLANK');

  const ReposCreateForAuthenticatedUserRequestMergeCommitMessage._(this.value);

  /// Creates a ReposCreateForAuthenticatedUserRequestMergeCommitMessage from a json value.
  factory ReposCreateForAuthenticatedUserRequestMergeCommitMessage.fromJson(
    String json,
  ) {
    return ReposCreateForAuthenticatedUserRequestMergeCommitMessage.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown ReposCreateForAuthenticatedUserRequestMergeCommitMessage value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateForAuthenticatedUserRequestMergeCommitMessage?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateForAuthenticatedUserRequestMergeCommitMessage.fromJson(
      json,
    );
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
