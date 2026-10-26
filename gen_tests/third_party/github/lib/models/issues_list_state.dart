enum IssuesListState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const IssuesListState._(this.value);

  /// Creates a IssuesListState from a json value.
  factory IssuesListState.fromJson(String json) {
    return IssuesListState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListState.fromJson(json);
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
