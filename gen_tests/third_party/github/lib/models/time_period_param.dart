enum TimePeriodParam {
  hour._('hour'),
  day._('day'),
  week._('week'),
  month._('month');

  const TimePeriodParam._(this.value);

  /// Creates a TimePeriodParam from a json value.
  factory TimePeriodParam.fromJson(String json) {
    return TimePeriodParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TimePeriodParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TimePeriodParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TimePeriodParam.fromJson(json);
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
