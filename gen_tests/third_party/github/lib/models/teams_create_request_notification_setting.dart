// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The notification setting the team has chosen. The options are:
/// * `notifications_enabled` - team members receive notifications when the team
/// is @mentioned.
///  * `notifications_disabled` - no one receives notifications.
/// Default: `notifications_enabled`
enum TeamsCreateRequestNotificationSetting {
  notificationsEnabled._('notifications_enabled'),
  notificationsDisabled._('notifications_disabled');

  const TeamsCreateRequestNotificationSetting._(this.value);

  /// Creates a TeamsCreateRequestNotificationSetting from a json value.
  factory TeamsCreateRequestNotificationSetting.fromJson(String json) {
    return TeamsCreateRequestNotificationSetting.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsCreateRequestNotificationSetting value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsCreateRequestNotificationSetting? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsCreateRequestNotificationSetting.fromJson(json);
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
