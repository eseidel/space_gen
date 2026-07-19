/// Timeline Event
/// Timeline Event
sealed class TimelineIssueEvents {
  static TimelineIssueEvents fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('TimelineIssueEvents.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineIssueEvents? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return TimelineIssueEvents.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
