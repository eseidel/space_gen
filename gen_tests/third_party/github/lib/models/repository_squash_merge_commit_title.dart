// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The default value for a squash merge commit title:
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit)
/// or the pull request's title (when more than one commit).
enum RepositorySquashMergeCommitTitle {
  prTitle._('PR_TITLE'),
  commitOrPrTitle._('COMMIT_OR_PR_TITLE');

  const RepositorySquashMergeCommitTitle._(this.value);

  /// Creates a RepositorySquashMergeCommitTitle from a json value.
  factory RepositorySquashMergeCommitTitle.fromJson(String json) {
    return RepositorySquashMergeCommitTitle.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositorySquashMergeCommitTitle value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositorySquashMergeCommitTitle? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositorySquashMergeCommitTitle.fromJson(json);
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
