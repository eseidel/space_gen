enum GuildScheduledEventStatuses {
  scheduled._(1),
  active._(2),
  completed._(3),
  canceled._(4);

  const GuildScheduledEventStatuses._(this.value);

  /// Creates a GuildScheduledEventStatuses from a json value.
  factory GuildScheduledEventStatuses.fromJson(int json) {
    return GuildScheduledEventStatuses.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GuildScheduledEventStatuses value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildScheduledEventStatuses? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildScheduledEventStatuses.fromJson(json);
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
