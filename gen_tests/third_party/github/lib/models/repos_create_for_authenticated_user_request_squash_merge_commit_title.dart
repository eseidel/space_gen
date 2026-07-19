// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// Required when using `squash_merge_commit_message`.
///
/// The default value for a squash merge commit title:
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit)
/// or the pull request's title (when more than one commit).
enum ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle {
  prTitle._('PR_TITLE'),
  commitOrPrTitle._('COMMIT_OR_PR_TITLE');

  const ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle._(
    this.value,
  );

  /// Creates a ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle from a json value.
  factory ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle.fromJson(
    String json,
  ) {
    return ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateForAuthenticatedUserRequestSquashMergeCommitTitle.fromJson(
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
