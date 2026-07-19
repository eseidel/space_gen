/// Required when using `squash_merge_commit_message`.
///
/// The default value for a squash merge commit title:
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit)
/// or the pull request's title (when more than one commit).
enum ReposCreateInOrgRequestSquashMergeCommitTitle {
  prTitle._('PR_TITLE'),
  commitOrPrTitle._('COMMIT_OR_PR_TITLE');

  const ReposCreateInOrgRequestSquashMergeCommitTitle._(this.value);

  /// Creates a ReposCreateInOrgRequestSquashMergeCommitTitle from a json value.
  factory ReposCreateInOrgRequestSquashMergeCommitTitle.fromJson(String json) {
    return ReposCreateInOrgRequestSquashMergeCommitTitle.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateInOrgRequestSquashMergeCommitTitle value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateInOrgRequestSquashMergeCommitTitle? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateInOrgRequestSquashMergeCommitTitle.fromJson(json);
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
