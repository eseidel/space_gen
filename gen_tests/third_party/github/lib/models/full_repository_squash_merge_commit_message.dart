// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The default value for a squash merge commit message:
///
/// - `PR_BODY` - default to the pull request's body.
/// - `COMMIT_MESSAGES` - default to the branch's commit messages.
/// - `BLANK` - default to a blank commit message.
/// Example: `'PR_BODY'`
enum FullRepositorySquashMergeCommitMessage {
  prBody._('PR_BODY'),
  commitMessages._('COMMIT_MESSAGES'),
  blank._('BLANK');

  const FullRepositorySquashMergeCommitMessage._(this.value);

  /// Creates a FullRepositorySquashMergeCommitMessage from a json value.
  factory FullRepositorySquashMergeCommitMessage.fromJson(String json) {
    return FullRepositorySquashMergeCommitMessage.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown FullRepositorySquashMergeCommitMessage value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FullRepositorySquashMergeCommitMessage? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FullRepositorySquashMergeCommitMessage.fromJson(json);
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
