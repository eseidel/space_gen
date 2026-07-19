enum AfkTimeouts {
  oneMinute._(60),
  fiveMinutes._(300),
  fifteenMinutes._(900),
  thirtyMinutes._(1800),
  oneHour._(3600);

  const AfkTimeouts._(this.value);

  /// Creates a AfkTimeouts from a json value.
  factory AfkTimeouts.fromJson(int json) {
    return AfkTimeouts.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown AfkTimeouts value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AfkTimeouts? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AfkTimeouts.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
