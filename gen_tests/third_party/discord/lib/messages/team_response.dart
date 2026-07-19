import 'package:discord/messages/team_member_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class TeamResponse {
  const TeamResponse({
    required this.id,
    required this.icon,
    required this.name,
    required this.ownerUserId,
    required this.members,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamResponse].
  factory TeamResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamResponse',
      json,
      () => TeamResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        icon: checkedKey(json, 'icon') as String?,
        name: json['name'] as String,
        ownerUserId: SnowflakeType.fromJson(json['owner_user_id'] as String),
        members: (json['members'] as List)
            .map<TeamMemberResponse>(
              (e) => TeamMemberResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String? icon;
  final String name;
  final SnowflakeType ownerUserId;
  final List<TeamMemberResponse> members;

  /// Converts a [TeamResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'icon': icon,
      'name': name,
      'owner_user_id': ownerUserId.toJson(),
      'members': members.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, icon, name, ownerUserId, listHash(members)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamResponse &&
        id == other.id &&
        icon == other.icon &&
        name == other.name &&
        ownerUserId == other.ownerUserId &&
        listsEqual(members, other.members);
  }
}
