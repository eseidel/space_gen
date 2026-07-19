/// The notification setting the team has set
/// Example: `'notifications_enabled'`
enum TeamFullNotificationSetting {
  notificationsEnabled._('notifications_enabled'),
  notificationsDisabled._('notifications_disabled');

  const TeamFullNotificationSetting._(this.value);

  /// Creates a TeamFullNotificationSetting from a json value.
  factory TeamFullNotificationSetting.fromJson(String json) {
    return TeamFullNotificationSetting.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamFullNotificationSetting value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamFullNotificationSetting? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamFullNotificationSetting.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
