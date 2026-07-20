import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateGuildMemberRequest {
  UpdateGuildMemberRequest({
    this.nick,
    this.roles,
    this.mute,
    this.deaf,
    this.channelId,
    this.communicationDisabledUntil,
    this.flags,
  }) {
    nick?.validate(maxLength: 32);
    roles?.validate(maxItems: 350, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildMemberRequest].
  factory UpdateGuildMemberRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildMemberRequest',
      json,
      () => UpdateGuildMemberRequest(
        nick: json['nick'] as String?,
        roles: (json['roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        mute: json['mute'] as bool?,
        deaf: json['deaf'] as bool?,
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        communicationDisabledUntil: maybeParseDateTime(
          json['communication_disabled_until'] as String?,
        ),
        flags: json['flags'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildMemberRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateGuildMemberRequest.fromJson(json);
  }

  final String? nick;
  final List<SnowflakeType>? roles;
  final bool? mute;
  final bool? deaf;
  final SnowflakeType? channelId;
  final DateTime? communicationDisabledUntil;
  final int? flags;

  /// Converts a [UpdateGuildMemberRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'nick': nick,
      'roles': roles?.map((e) => e.toJson()).toList(),
      'mute': mute,
      'deaf': deaf,
      'channel_id': channelId?.toJson(),
      'communication_disabled_until': communicationDisabledUntil
          ?.toIso8601String(),
      'flags': flags,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    nick,
    listHash(roles),
    mute,
    deaf,
    channelId,
    communicationDisabledUntil,
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildMemberRequest &&
        nick == other.nick &&
        listsEqual(roles, other.roles) &&
        mute == other.mute &&
        deaf == other.deaf &&
        channelId == other.channelId &&
        communicationDisabledUntil == other.communicationDisabledUntil &&
        flags == other.flags;
  }
}
