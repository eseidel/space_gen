enum ApplicationCommandType {
  /// Slash commands; a text-based command that shows up when a user types /
  chat._(1),

  /// A UI-based command that shows up when you right click or tap on a user
  user._(2),

  /// A UI-based command that shows up when you right click or tap on a
  /// message
  message._(3),

  /// A command that represents the primary way to use an application (e.g.
  /// launching an Activity)
  primaryEntryPoint._(4);

  const ApplicationCommandType._(this.value);

  /// Creates a ApplicationCommandType from a json value.
  factory ApplicationCommandType.fromJson(int json) {
    return ApplicationCommandType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ApplicationCommandType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationCommandType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandType.fromJson(json);
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
