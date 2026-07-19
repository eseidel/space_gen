import 'package:discord/messages/basic_guild_member_response.dart';
import 'package:discord/messages/guild_role_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/resolved_objects_response_channels.dart';
import 'package:meta/meta.dart';

@immutable
class ResolvedObjectsResponse {
  const ResolvedObjectsResponse({
    this.users,
    this.members,
    this.channels,
    this.roles,
  });

  /// Converts a `Map<String, dynamic>` to a [ResolvedObjectsResponse].
  factory ResolvedObjectsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ResolvedObjectsResponse',
      json,
      () => ResolvedObjectsResponse(
        users: (json['users'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            UserResponse.fromJson(value as Map<String, dynamic>),
          ),
        ),
        members: (json['members'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            BasicGuildMemberResponse.fromJson(value as Map<String, dynamic>),
          ),
        ),
        channels: (json['channels'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            ResolvedObjectsResponseChannels.fromJson(
              value as Map<String, dynamic>,
            ),
          ),
        ),
        roles: (json['roles'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            GuildRoleResponse.fromJson(value as Map<String, dynamic>),
          ),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ResolvedObjectsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ResolvedObjectsResponse.fromJson(json);
  }

  final Map<String, UserResponse>? users;
  final Map<String, BasicGuildMemberResponse>? members;
  final Map<String, ResolvedObjectsResponseChannels>? channels;
  final Map<String, GuildRoleResponse>? roles;

  /// Converts a [ResolvedObjectsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'users': users?.map((key, value) => MapEntry(key, value.toJson())),
      'members': members?.map((key, value) => MapEntry(key, value.toJson())),
      'channels': channels?.map((key, value) => MapEntry(key, value.toJson())),
      'roles': roles?.map((key, value) => MapEntry(key, value.toJson())),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    mapHash(users),
    mapHash(members),
    mapHash(channels),
    mapHash(roles),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ResolvedObjectsResponse &&
        mapsEqual(users, other.users) &&
        mapsEqual(members, other.members) &&
        mapsEqual(channels, other.channels) &&
        mapsEqual(roles, other.roles);
  }
}
