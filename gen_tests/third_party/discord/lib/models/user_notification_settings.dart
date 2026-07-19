enum UserNotificationSettings {
  /// members will receive notifications for all messages by default
  allMessages._(0),

  /// members will receive notifications only for messages that @mention them
  /// by default
  onlyMentions._(1);

  const UserNotificationSettings._(this.value);

  /// Creates a UserNotificationSettings from a json value.
  factory UserNotificationSettings.fromJson(int json) {
    return UserNotificationSettings.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown UserNotificationSettings value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static UserNotificationSettings? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return UserNotificationSettings.fromJson(json);
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
