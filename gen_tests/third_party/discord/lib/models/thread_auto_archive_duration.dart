enum ThreadAutoArchiveDuration {
  /// One hour
  oneHour._(60),

  /// One day
  oneDay._(1440),

  /// Three days
  threeDay._(4320),

  /// Seven days
  sevenDay._(10080);

  const ThreadAutoArchiveDuration._(this.value);

  /// Creates a ThreadAutoArchiveDuration from a json value.
  factory ThreadAutoArchiveDuration.fromJson(int json) {
    return ThreadAutoArchiveDuration.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ThreadAutoArchiveDuration value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ThreadAutoArchiveDuration? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ThreadAutoArchiveDuration.fromJson(json);
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
