/// The state of the milestone. Either `open` or `closed`.
enum IssuesUpdateMilestoneRequestState {
  open._('open'),
  closed._('closed');

  const IssuesUpdateMilestoneRequestState._(this.value);

  /// Creates a IssuesUpdateMilestoneRequestState from a json value.
  factory IssuesUpdateMilestoneRequestState.fromJson(String json) {
    return IssuesUpdateMilestoneRequestState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesUpdateMilestoneRequestState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesUpdateMilestoneRequestState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateMilestoneRequestState.fromJson(json);
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
