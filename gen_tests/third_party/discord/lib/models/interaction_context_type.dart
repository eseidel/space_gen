enum InteractionContextType {
  /// This command can be used within a Guild.
  guild._(0),

  /// This command can be used within a DM with this application's bot.
  botDm._(1),

  /// This command can be used within DMs and Group DMs with users.
  privateChannel._(2);

  const InteractionContextType._(this.value);

  /// Creates a InteractionContextType from a json value.
  factory InteractionContextType.fromJson(int json) {
    return InteractionContextType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown InteractionContextType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InteractionContextType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return InteractionContextType.fromJson(json);
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
