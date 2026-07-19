// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Required when using `merge_commit_message`.
///
/// The default value for a merge commit title.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g.,
/// Merge pull request #123 from branch-name).
enum ReposCreateForAuthenticatedUserRequestMergeCommitTitle {
  prTitle._('PR_TITLE'),
  mergeMessage._('MERGE_MESSAGE');

  const ReposCreateForAuthenticatedUserRequestMergeCommitTitle._(this.value);

  /// Creates a ReposCreateForAuthenticatedUserRequestMergeCommitTitle from a json value.
  factory ReposCreateForAuthenticatedUserRequestMergeCommitTitle.fromJson(
    String json,
  ) {
    return ReposCreateForAuthenticatedUserRequestMergeCommitTitle.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateForAuthenticatedUserRequestMergeCommitTitle value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateForAuthenticatedUserRequestMergeCommitTitle? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateForAuthenticatedUserRequestMergeCommitTitle.fromJson(
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
