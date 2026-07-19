/// The default value for a merge commit message.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `PR_BODY` - default to the pull request's body.
/// - `BLANK` - default to a blank commit message.
enum ReposUpdateRequestMergeCommitMessage {
  prBody._('PR_BODY'),
  prTitle._('PR_TITLE'),
  blank._('BLANK');

  const ReposUpdateRequestMergeCommitMessage._(this.value);

  /// Creates a ReposUpdateRequestMergeCommitMessage from a json value.
  factory ReposUpdateRequestMergeCommitMessage.fromJson(String json) {
    return ReposUpdateRequestMergeCommitMessage.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposUpdateRequestMergeCommitMessage value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestMergeCommitMessage? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestMergeCommitMessage.fromJson(json);
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
