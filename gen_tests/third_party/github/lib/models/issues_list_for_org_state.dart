enum IssuesListForOrgState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const IssuesListForOrgState._(this.value);

  /// Creates a IssuesListForOrgState from a json value.
  factory IssuesListForOrgState.fromJson(String json) {
    return IssuesListForOrgState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListForOrgState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForOrgState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForOrgState.fromJson(json);
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
