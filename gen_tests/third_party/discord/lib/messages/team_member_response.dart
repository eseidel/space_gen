import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/team_member_roles.dart';
import 'package:discord/models/team_membership_states.dart';
import 'package:meta/meta.dart';

@immutable
class TeamMemberResponse {
  const TeamMemberResponse({
    required this.user,
    required this.teamId,
    required this.membershipState,
    required this.role,
    required this.permissions,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamMemberResponse].
  factory TeamMemberResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamMemberResponse',
      json,
      () => TeamMemberResponse(
        user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
        teamId: SnowflakeType.fromJson(json['team_id'] as String),
        membershipState: TeamMembershipStates.fromJson(
          json['membership_state'] as int,
        ),
        role: TeamMemberRoles.fromJson(json['role'] as String),
        permissions: (json['permissions'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamMemberResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamMemberResponse.fromJson(json);
  }

  final UserResponse user;
  final SnowflakeType teamId;
  final TeamMembershipStates membershipState;
  final TeamMemberRoles role;
  final List<String> permissions;

  /// Converts a [TeamMemberResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'team_id': teamId.toJson(),
      'membership_state': membershipState.toJson(),
      'role': role.toJson(),
      'permissions': permissions,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    user,
    teamId,
    membershipState,
    role,
    listHash(permissions),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamMemberResponse &&
        user == other.user &&
        teamId == other.teamId &&
        membershipState == other.membershipState &&
        role == other.role &&
        listsEqual(permissions, other.permissions);
  }
}
