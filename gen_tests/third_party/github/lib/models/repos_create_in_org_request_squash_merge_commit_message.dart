// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The default value for a squash merge commit message:
///
/// - `PR_BODY` - default to the pull request's body.
/// - `COMMIT_MESSAGES` - default to the branch's commit messages.
/// - `BLANK` - default to a blank commit message.
enum ReposCreateInOrgRequestSquashMergeCommitMessage {
  prBody._('PR_BODY'),
  commitMessages._('COMMIT_MESSAGES'),
  blank._('BLANK');

  const ReposCreateInOrgRequestSquashMergeCommitMessage._(this.value);

  /// Creates a ReposCreateInOrgRequestSquashMergeCommitMessage from a json value.
  factory ReposCreateInOrgRequestSquashMergeCommitMessage.fromJson(
    String json,
  ) {
    return ReposCreateInOrgRequestSquashMergeCommitMessage.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateInOrgRequestSquashMergeCommitMessage value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateInOrgRequestSquashMergeCommitMessage? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateInOrgRequestSquashMergeCommitMessage.fromJson(json);
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
