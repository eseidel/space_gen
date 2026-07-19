import 'package:github/model_helpers.dart';
import 'package:github/models/team_membership_role.dart';
import 'package:github/models/team_membership_state.dart';
import 'package:meta/meta.dart';

/// {@template team_membership}
/// Team Membership
/// Team Membership
/// {@endtemplate}
@immutable
class TeamMembership {
  /// {@macro team_membership}
  const TeamMembership({
    required this.url,
    required this.state,
    this.role = TeamMembershipRole.member,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamMembership].
  factory TeamMembership.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamMembership',
      json,
      () => TeamMembership(
        url: Uri.parse(json['url'] as String),
        role: TeamMembershipRole.fromJson(json['role'] as String),
        state: TeamMembershipState.fromJson(json['state'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamMembership? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamMembership.fromJson(json);
  }

  final Uri url;

  /// The role of the user in the team.
  /// Example: `'member'`
  final TeamMembershipRole role;

  /// The state of the user's membership in the team.
  final TeamMembershipState state;

  /// Converts a [TeamMembership] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'role': role.toJson(),
      'state': state.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([url, role, state]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamMembership &&
        url == other.url &&
        role == other.role &&
        state == other.state;
  }
}
