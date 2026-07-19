import 'package:github/model_helpers.dart';
import 'package:github/models/teams_update_legacy_request_notification_setting.dart';
import 'package:github/models/teams_update_legacy_request_permission.dart';
import 'package:github/models/teams_update_legacy_request_privacy.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsUpdateLegacyRequest {
  const TeamsUpdateLegacyRequest({
    required this.name,
    this.description,
    this.privacy,
    this.notificationSetting,
    this.permission = TeamsUpdateLegacyRequestPermission.pull,
    this.parentTeamId,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamsUpdateLegacyRequest].
  factory TeamsUpdateLegacyRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamsUpdateLegacyRequest',
      json,
      () => TeamsUpdateLegacyRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        privacy: TeamsUpdateLegacyRequestPrivacy.maybeFromJson(
          json['privacy'] as String?,
        ),
        notificationSetting:
            TeamsUpdateLegacyRequestNotificationSetting.maybeFromJson(
              json['notification_setting'] as String?,
            ),
        permission:
            TeamsUpdateLegacyRequestPermission.maybeFromJson(
              json['permission'] as String?,
            ) ??
            TeamsUpdateLegacyRequestPermission.pull,
        parentTeamId: json['parent_team_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsUpdateLegacyRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateLegacyRequest.fromJson(json);
  }

  /// The name of the team.
  final String name;

  /// The description of the team.
  final String? description;

  /// The level of privacy this team should have. Editing teams without
  /// specifying this parameter leaves `privacy` intact. The options are:
  /// **For a non-nested team:**
  /// * `secret` - only visible to organization owners and members of this
  /// team.
  ///  * `closed` - visible to all members of this organization.
  /// **For a parent or child team:**
  ///  * `closed` - visible to all members of this organization.
  final TeamsUpdateLegacyRequestPrivacy? privacy;

  /// The notification setting the team has chosen. Editing teams without
  /// specifying this parameter leaves `notification_setting` intact. The
  /// options are:
  /// * `notifications_enabled` - team members receive notifications when the
  /// team is @mentioned.
  ///  * `notifications_disabled` - no one receives notifications.
  final TeamsUpdateLegacyRequestNotificationSetting? notificationSetting;

  /// **Closing down notice**. The permission that new repositories will be
  /// added to the team with when none is specified.
  final TeamsUpdateLegacyRequestPermission? permission;

  /// The ID of a team to set as the parent team.
  final int? parentTeamId;

  /// Converts a [TeamsUpdateLegacyRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'privacy': privacy?.toJson(),
      'notification_setting': notificationSetting?.toJson(),
      'permission': permission?.toJson(),
      'parent_team_id': parentTeamId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    privacy,
    notificationSetting,
    permission,
    parentTeamId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsUpdateLegacyRequest &&
        name == other.name &&
        description == other.description &&
        privacy == other.privacy &&
        notificationSetting == other.notificationSetting &&
        permission == other.permission &&
        parentTeamId == other.parentTeamId;
  }
}
