enum PerParam {
  day._('day'),
  week._('week');

  const PerParam._(this.value);

  /// Creates a PerParam from a json value.
  factory PerParam.fromJson(String json) {
    return PerParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown PerParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PerParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PerParam.fromJson(json);
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
