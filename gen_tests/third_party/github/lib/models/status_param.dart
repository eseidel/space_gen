enum StatusParam {
  queued._('queued'),
  inProgress._('in_progress'),
  completed._('completed');

  const StatusParam._(this.value);

  /// Creates a StatusParam from a json value.
  factory StatusParam.fromJson(String json) {
    return StatusParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown StatusParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static StatusParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return StatusParam.fromJson(json);
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
