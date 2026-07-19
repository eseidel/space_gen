/// The default value for a merge commit title.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `MERGE_MESSAGE` - default to the classic title for a merge message (e.g.,
/// Merge pull request #123 from branch-name).
enum RepositoryMergeCommitTitle {
  prTitle._('PR_TITLE'),
  mergeMessage._('MERGE_MESSAGE');

  const RepositoryMergeCommitTitle._(this.value);

  /// Creates a RepositoryMergeCommitTitle from a json value.
  factory RepositoryMergeCommitTitle.fromJson(String json) {
    return RepositoryMergeCommitTitle.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryMergeCommitTitle value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryMergeCommitTitle? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryMergeCommitTitle.fromJson(json);
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
