/// The notification setting the team has chosen. Editing teams without
/// specifying this parameter leaves `notification_setting` intact. The options
/// are:
/// * `notifications_enabled` - team members receive notifications when the team
/// is @mentioned.
///  * `notifications_disabled` - no one receives notifications.
enum TeamsUpdateInOrgRequestNotificationSetting {
  notificationsEnabled._('notifications_enabled'),
  notificationsDisabled._('notifications_disabled');

  const TeamsUpdateInOrgRequestNotificationSetting._(this.value);

  /// Creates a TeamsUpdateInOrgRequestNotificationSetting from a json value.
  factory TeamsUpdateInOrgRequestNotificationSetting.fromJson(String json) {
    return TeamsUpdateInOrgRequestNotificationSetting.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsUpdateInOrgRequestNotificationSetting value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsUpdateInOrgRequestNotificationSetting? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateInOrgRequestNotificationSetting.fromJson(json);
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
