import 'package:github/model_helpers.dart';
import 'package:github/models/teams_create_request_notification_setting.dart';
import 'package:github/models/teams_create_request_permission.dart';
import 'package:github/models/teams_create_request_privacy.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsCreateRequest {
  const TeamsCreateRequest({
    required this.name,
    this.description,
    this.maintainers,
    this.repoNames,
    this.privacy,
    this.notificationSetting,
    this.permission = .pull,
    this.parentTeamId,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamsCreateRequest].
  factory TeamsCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamsCreateRequest',
      json,
      () => TeamsCreateRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        maintainers: (json['maintainers'] as List?)?.cast<String>(),
        repoNames: (json['repo_names'] as List?)?.cast<String>(),
        privacy: TeamsCreateRequestPrivacy.maybeFromJson(
          json['privacy'] as String?,
        ),
        notificationSetting:
            TeamsCreateRequestNotificationSetting.maybeFromJson(
              json['notification_setting'] as String?,
            ),
        permission:
            TeamsCreateRequestPermission.maybeFromJson(
              json['permission'] as String?,
            ) ??
            .pull,
        parentTeamId: json['parent_team_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamsCreateRequest.fromJson(json);
  }

  /// The name of the team.
  final String name;

  /// The description of the team.
  final String? description;

  /// List GitHub usernames for organization members who will become team
  /// maintainers.
  final List<String>? maintainers;

  /// The full name (e.g., "organization-name/repository-name") of
  /// repositories to add the team to.
  final List<String>? repoNames;

  /// The level of privacy this team should have. The options are:
  /// **For a non-nested team:**
  /// * `secret` - only visible to organization owners and members of this
  /// team.
  ///  * `closed` - visible to all members of this organization.
  /// Default: `secret`
  /// **For a parent or child team:**
  ///  * `closed` - visible to all members of this organization.
  /// Default for child team: `closed`
  final TeamsCreateRequestPrivacy? privacy;

  /// The notification setting the team has chosen. The options are:
  /// * `notifications_enabled` - team members receive notifications when the
  /// team is @mentioned.
  ///  * `notifications_disabled` - no one receives notifications.
  /// Default: `notifications_enabled`
  final TeamsCreateRequestNotificationSetting? notificationSetting;

  /// **Closing down notice**. The permission that new repositories will be
  /// added to the team with when none is specified.
  final TeamsCreateRequestPermission permission;

  /// The ID of a team to set as the parent team.
  final int? parentTeamId;

  /// Converts a [TeamsCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': ?description,
      'maintainers': ?maintainers,
      'repo_names': ?repoNames,
      'privacy': ?privacy?.toJson(),
      'notification_setting': ?notificationSetting?.toJson(),
      'permission': permission.toJson(),
      'parent_team_id': ?parentTeamId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    listHash(maintainers),
    listHash(repoNames),
    privacy,
    notificationSetting,
    permission,
    parentTeamId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsCreateRequest &&
        name == other.name &&
        description == other.description &&
        listsEqual(maintainers, other.maintainers) &&
        listsEqual(repoNames, other.repoNames) &&
        privacy == other.privacy &&
        notificationSetting == other.notificationSetting &&
        permission == other.permission &&
        parentTeamId == other.parentTeamId;
  }
}
