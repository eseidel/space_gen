/// The default value for a squash merge commit title:
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit)
/// or the pull request's title (when more than one commit).
/// Example: `'PR_TITLE'`
enum FullRepositorySquashMergeCommitTitle {
  prTitle._('PR_TITLE'),
  commitOrPrTitle._('COMMIT_OR_PR_TITLE');

  const FullRepositorySquashMergeCommitTitle._(this.value);

  /// Creates a FullRepositorySquashMergeCommitTitle from a json value.
  factory FullRepositorySquashMergeCommitTitle.fromJson(String json) {
    return FullRepositorySquashMergeCommitTitle.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown FullRepositorySquashMergeCommitTitle value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FullRepositorySquashMergeCommitTitle? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FullRepositorySquashMergeCommitTitle.fromJson(json);
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
