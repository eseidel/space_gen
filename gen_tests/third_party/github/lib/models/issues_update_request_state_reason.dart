/// The reason for the state change. Ignored unless `state` is changed.
/// Example: `'not_planned'`
enum IssuesUpdateRequestStateReason {
  completed._('completed'),
  notPlanned._('not_planned'),
  reopened._('reopened');

  const IssuesUpdateRequestStateReason._(this.value);

  /// Creates a IssuesUpdateRequestStateReason from a json value.
  factory IssuesUpdateRequestStateReason.fromJson(String json) {
    return IssuesUpdateRequestStateReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesUpdateRequestStateReason value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesUpdateRequestStateReason? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateRequestStateReason.fromJson(json);
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
