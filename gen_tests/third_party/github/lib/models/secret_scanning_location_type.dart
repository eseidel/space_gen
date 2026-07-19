/// The location type. Because secrets may be found in different types of
/// resources (ie. code, comments, issues, pull requests, discussions), this
/// field identifies the type of resource where the secret was found.
/// Example: `'commit'`
enum SecretScanningLocationType {
  commit._('commit'),
  wikiCommit._('wiki_commit'),
  issueTitle._('issue_title'),
  issueBody._('issue_body'),
  issueComment._('issue_comment'),
  discussionTitle._('discussion_title'),
  discussionBody._('discussion_body'),
  discussionComment._('discussion_comment'),
  pullRequestTitle._('pull_request_title'),
  pullRequestBody._('pull_request_body'),
  pullRequestComment._('pull_request_comment'),
  pullRequestReview._('pull_request_review'),
  pullRequestReviewComment._('pull_request_review_comment');

  const SecretScanningLocationType._(this.value);

  /// Creates a SecretScanningLocationType from a json value.
  factory SecretScanningLocationType.fromJson(String json) {
    return SecretScanningLocationType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecretScanningLocationType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecretScanningLocationType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationType.fromJson(json);
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
