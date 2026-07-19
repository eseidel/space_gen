enum GuildScheduledEventEntityTypes {
  none._(0),
  stageInstance._(1),
  voice._(2),
  external_._(3);

  const GuildScheduledEventEntityTypes._(this.value);

  /// Creates a GuildScheduledEventEntityTypes from a json value.
  factory GuildScheduledEventEntityTypes.fromJson(int json) {
    return GuildScheduledEventEntityTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GuildScheduledEventEntityTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildScheduledEventEntityTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildScheduledEventEntityTypes.fromJson(json);
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
