/// The open or closed state of the issue.
enum IssuesUpdateRequestState {
  open._('open'),
  closed._('closed');

  const IssuesUpdateRequestState._(this.value);

  /// Creates a IssuesUpdateRequestState from a json value.
  factory IssuesUpdateRequestState.fromJson(String json) {
    return IssuesUpdateRequestState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesUpdateRequestState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesUpdateRequestState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateRequestState.fromJson(json);
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
