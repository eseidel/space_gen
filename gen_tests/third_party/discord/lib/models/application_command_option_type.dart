enum ApplicationCommandOptionType {
  /// A sub-action within a command or group
  subCommand._(1),

  /// A group of subcommands
  subCommandGroup._(2),

  /// A string option
  string._(3),

  /// An integer option. Any integer between -2^53 and 2^53 is a valid value
  integer._(4),

  /// A boolean option
  boolean._(5),

  /// A snowflake option that represents a User
  user._(6),

  /// A snowflake option that represents a Channel. Includes all channel types
  /// and categories
  channel._(7),

  /// A snowflake option that represents a Role
  role._(8),

  /// A snowflake option that represents anything you can mention
  mentionable._(9),

  /// A number option. Any double between -2^53 and 2^53 is a valid value
  number._(10),

  /// An attachment option
  attachment._(11);

  const ApplicationCommandOptionType._(this.value);

  /// Creates a ApplicationCommandOptionType from a json value.
  factory ApplicationCommandOptionType.fromJson(int json) {
    return ApplicationCommandOptionType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApplicationCommandOptionType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationCommandOptionType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandOptionType.fromJson(json);
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
