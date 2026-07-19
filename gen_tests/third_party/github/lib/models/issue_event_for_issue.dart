/// Issue Event for Issue
/// Issue Event for Issue
sealed class IssueEventForIssue {
  static IssueEventForIssue fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('IssueEventForIssue.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueEventForIssue? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssueEventForIssue.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
