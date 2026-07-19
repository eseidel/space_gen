import 'package:discord/messages/guild_member_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ThreadMemberResponse {
  const ThreadMemberResponse({
    required this.id,
    required this.userId,
    required this.joinTimestamp,
    required this.flags,
    this.member,
  });

  /// Converts a `Map<String, dynamic>` to a [ThreadMemberResponse].
  factory ThreadMemberResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThreadMemberResponse',
      json,
      () => ThreadMemberResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        userId: SnowflakeType.fromJson(json['user_id'] as String),
        joinTimestamp: DateTime.parse(json['join_timestamp'] as String),
        flags: json['flags'] as int,
        member: GuildMemberResponse.maybeFromJson(
          json['member'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadMemberResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThreadMemberResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType userId;
  final DateTime joinTimestamp;
  final int flags;
  final GuildMemberResponse? member;

  /// Converts a [ThreadMemberResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'user_id': userId.toJson(),
      'join_timestamp': joinTimestamp.toIso8601String(),
      'flags': flags,
      'member': ?member?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, userId, joinTimestamp, flags, member]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadMemberResponse &&
        id == other.id &&
        userId == other.userId &&
        joinTimestamp == other.joinTimestamp &&
        flags == other.flags &&
        member == other.member;
  }
}
