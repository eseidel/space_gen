/// Required when using `merge_commit_message`.
///
/// The default value for a merge commit title.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g.,
/// Merge pull request #123 from branch-name).
enum ReposCreateInOrgRequestMergeCommitTitle {
  prTitle._('PR_TITLE'),
  mergeMessage._('MERGE_MESSAGE');

  const ReposCreateInOrgRequestMergeCommitTitle._(this.value);

  /// Creates a ReposCreateInOrgRequestMergeCommitTitle from a json value.
  factory ReposCreateInOrgRequestMergeCommitTitle.fromJson(String json) {
    return ReposCreateInOrgRequestMergeCommitTitle.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateInOrgRequestMergeCommitTitle value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateInOrgRequestMergeCommitTitle? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateInOrgRequestMergeCommitTitle.fromJson(json);
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
