/// The default value for a merge commit message.
///
/// - `PR_TITLE` - default to the pull request's title.
/// - `PR_BODY` - default to the pull request's body.
/// - `BLANK` - default to a blank commit message.
enum ReposCreateInOrgRequestMergeCommitMessage {
  prBody._('PR_BODY'),
  prTitle._('PR_TITLE'),
  blank._('BLANK');

  const ReposCreateInOrgRequestMergeCommitMessage._(this.value);

  /// Creates a ReposCreateInOrgRequestMergeCommitMessage from a json value.
  factory ReposCreateInOrgRequestMergeCommitMessage.fromJson(String json) {
    return ReposCreateInOrgRequestMergeCommitMessage.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateInOrgRequestMergeCommitMessage value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateInOrgRequestMergeCommitMessage? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateInOrgRequestMergeCommitMessage.fromJson(json);
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
