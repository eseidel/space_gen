enum GuildScheduledEventPrivacyLevels {
  /// the scheduled event is only accessible to guild members
  guildOnly._(2);

  const GuildScheduledEventPrivacyLevels._(this.value);

  /// Creates a GuildScheduledEventPrivacyLevels from a json value.
  factory GuildScheduledEventPrivacyLevels.fromJson(int json) {
    return GuildScheduledEventPrivacyLevels.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GuildScheduledEventPrivacyLevels value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildScheduledEventPrivacyLevels? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildScheduledEventPrivacyLevels.fromJson(json);
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
