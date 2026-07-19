/// The reason for the current state
/// Example: `'not_planned'`
enum IssueStateReason {
  completed._('completed'),
  reopened._('reopened'),
  notPlanned._('not_planned');

  const IssueStateReason._(this.value);

  /// Creates a IssueStateReason from a json value.
  factory IssueStateReason.fromJson(String json) {
    return IssueStateReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssueStateReason value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssueStateReason? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssueStateReason.fromJson(json);
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
