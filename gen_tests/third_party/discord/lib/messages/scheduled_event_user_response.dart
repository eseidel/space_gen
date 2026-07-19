import 'package:discord/messages/guild_member_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ScheduledEventUserResponse {
  const ScheduledEventUserResponse({
    required this.guildScheduledEventId,
    required this.userId,
    this.user,
    this.member,
  });

  /// Converts a `Map<String, dynamic>` to a [ScheduledEventUserResponse].
  factory ScheduledEventUserResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScheduledEventUserResponse',
      json,
      () => ScheduledEventUserResponse(
        guildScheduledEventId: SnowflakeType.fromJson(
          json['guild_scheduled_event_id'] as String,
        ),
        userId: SnowflakeType.fromJson(json['user_id'] as String),
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
        member: GuildMemberResponse.maybeFromJson(
          json['member'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScheduledEventUserResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScheduledEventUserResponse.fromJson(json);
  }

  final SnowflakeType guildScheduledEventId;
  final SnowflakeType userId;
  final UserResponse? user;
  final GuildMemberResponse? member;

  /// Converts a [ScheduledEventUserResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'guild_scheduled_event_id': guildScheduledEventId.toJson(),
      'user_id': userId.toJson(),
      'user': user?.toJson(),
      'member': member?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([guildScheduledEventId, userId, user, member]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScheduledEventUserResponse &&
        guildScheduledEventId == other.guildScheduledEventId &&
        userId == other.userId &&
        user == other.user &&
        member == other.member;
  }
}
