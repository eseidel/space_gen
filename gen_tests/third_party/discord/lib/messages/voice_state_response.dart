import 'package:discord/messages/guild_member_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class VoiceStateResponse {
  const VoiceStateResponse({
    required this.channelId,
    required this.deaf,
    required this.guildId,
    required this.mute,
    required this.requestToSpeakTimestamp,
    required this.suppress,
    required this.selfStream,
    required this.selfDeaf,
    required this.selfMute,
    required this.selfVideo,
    required this.sessionId,
    required this.userId,
    this.member,
  });

  /// Converts a `Map<String, dynamic>` to a [VoiceStateResponse].
  factory VoiceStateResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'VoiceStateResponse',
      json,
      () => VoiceStateResponse(
        channelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'channel_id') as String?,
        ),
        deaf: json['deaf'] as bool,
        guildId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'guild_id') as String?,
        ),
        member: GuildMemberResponse.maybeFromJson(
          json['member'] as Map<String, dynamic>?,
        ),
        mute: json['mute'] as bool,
        requestToSpeakTimestamp: maybeParseDateTime(
          checkedKey(json, 'request_to_speak_timestamp') as String?,
        ),
        suppress: json['suppress'] as bool,
        selfStream: checkedKey(json, 'self_stream') as bool?,
        selfDeaf: json['self_deaf'] as bool,
        selfMute: json['self_mute'] as bool,
        selfVideo: json['self_video'] as bool,
        sessionId: json['session_id'] as String,
        userId: SnowflakeType.fromJson(json['user_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static VoiceStateResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return VoiceStateResponse.fromJson(json);
  }

  final SnowflakeType? channelId;
  final bool deaf;
  final SnowflakeType? guildId;
  final GuildMemberResponse? member;
  final bool mute;
  final DateTime? requestToSpeakTimestamp;
  final bool suppress;
  final bool? selfStream;
  final bool selfDeaf;
  final bool selfMute;
  final bool selfVideo;
  final String sessionId;
  final SnowflakeType userId;

  /// Converts a [VoiceStateResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'channel_id': channelId?.toJson(),
      'deaf': deaf,
      'guild_id': guildId?.toJson(),
      'member': member?.toJson(),
      'mute': mute,
      'request_to_speak_timestamp': requestToSpeakTimestamp?.toIso8601String(),
      'suppress': suppress,
      'self_stream': selfStream,
      'self_deaf': selfDeaf,
      'self_mute': selfMute,
      'self_video': selfVideo,
      'session_id': sessionId,
      'user_id': userId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    channelId,
    deaf,
    guildId,
    member,
    mute,
    requestToSpeakTimestamp,
    suppress,
    selfStream,
    selfDeaf,
    selfMute,
    selfVideo,
    sessionId,
    userId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VoiceStateResponse &&
        channelId == other.channelId &&
        deaf == other.deaf &&
        guildId == other.guildId &&
        member == other.member &&
        mute == other.mute &&
        requestToSpeakTimestamp == other.requestToSpeakTimestamp &&
        suppress == other.suppress &&
        selfStream == other.selfStream &&
        selfDeaf == other.selfDeaf &&
        selfMute == other.selfMute &&
        selfVideo == other.selfVideo &&
        sessionId == other.sessionId &&
        userId == other.userId;
  }
}
