enum IssuesListForAuthenticatedUserState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const IssuesListForAuthenticatedUserState._(this.value);

  /// Creates a IssuesListForAuthenticatedUserState from a json value.
  factory IssuesListForAuthenticatedUserState.fromJson(String json) {
    return IssuesListForAuthenticatedUserState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForAuthenticatedUserState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForAuthenticatedUserState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForAuthenticatedUserState.fromJson(json);
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
