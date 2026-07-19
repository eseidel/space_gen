enum MessageShareCustomUserThemeBaseTheme {
  /// No base theme
  unset._(0),

  /// Dark base theme
  dark._(1),

  /// Light base theme
  light._(2),

  /// Darker base theme
  darker._(3),

  /// Midnight base theme
  midnight._(4);

  const MessageShareCustomUserThemeBaseTheme._(this.value);

  /// Creates a MessageShareCustomUserThemeBaseTheme from a json value.
  factory MessageShareCustomUserThemeBaseTheme.fromJson(int json) {
    return MessageShareCustomUserThemeBaseTheme.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MessageShareCustomUserThemeBaseTheme value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MessageShareCustomUserThemeBaseTheme? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return MessageShareCustomUserThemeBaseTheme.fromJson(json);
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
