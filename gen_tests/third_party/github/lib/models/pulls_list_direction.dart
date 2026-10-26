enum PullsListDirection {
  asc._('asc'),
  desc._('desc');

  const PullsListDirection._(this.value);

  /// Creates a PullsListDirection from a json value.
  factory PullsListDirection.fromJson(String json) {
    return PullsListDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PullsListDirection value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListDirection.fromJson(json);
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
