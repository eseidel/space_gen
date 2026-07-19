/// The default value for a merge commit message.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `PR_BODY` - default to the pull request's body.
/// - `BLANK` - default to a blank commit message.
/// Example: `'PR_BODY'`
enum FullRepositoryMergeCommitMessage {
  prBody._('PR_BODY'),
  prTitle._('PR_TITLE'),
  blank._('BLANK');

  const FullRepositoryMergeCommitMessage._(this.value);

  /// Creates a FullRepositoryMergeCommitMessage from a json value.
  factory FullRepositoryMergeCommitMessage.fromJson(String json) {
    return FullRepositoryMergeCommitMessage.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown FullRepositoryMergeCommitMessage value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FullRepositoryMergeCommitMessage? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FullRepositoryMergeCommitMessage.fromJson(json);
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
