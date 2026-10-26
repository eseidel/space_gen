enum PullsListState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const PullsListState._(this.value);

  /// Creates a PullsListState from a json value.
  factory PullsListState.fromJson(String json) {
    return PullsListState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PullsListState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListState.fromJson(json);
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
