import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BotAddGuildMemberRequest {
  BotAddGuildMemberRequest({
    required this.accessToken,
    this.nick,
    this.roles,
    this.mute,
    this.deaf,
    this.flags,
  }) {
    nick?.validate(maxLength: 32);
    roles?.validate(maxItems: 250, unique: true);
    accessToken.validate(maxLength: 10240);
  }

  /// Converts a `Map<String, dynamic>` to a [BotAddGuildMemberRequest].
  factory BotAddGuildMemberRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BotAddGuildMemberRequest',
      json,
      () => BotAddGuildMemberRequest(
        nick: json['nick'] as String?,
        roles: (json['roles'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        mute: json['mute'] as bool?,
        deaf: json['deaf'] as bool?,
        accessToken: json['access_token'] as String,
        flags: json['flags'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BotAddGuildMemberRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BotAddGuildMemberRequest.fromJson(json);
  }

  final String? nick;
  final List<SnowflakeType>? roles;
  final bool? mute;
  final bool? deaf;
  final String accessToken;
  final int? flags;

  /// Converts a [BotAddGuildMemberRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'nick': nick,
      'roles': roles?.map((e) => e.toJson()).toList(),
      'mute': mute,
      'deaf': deaf,
      'access_token': accessToken,
      'flags': flags,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([nick, listHash(roles), mute, deaf, accessToken, flags]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BotAddGuildMemberRequest &&
        nick == other.nick &&
        listsEqual(roles, other.roles) &&
        mute == other.mute &&
        deaf == other.deaf &&
        accessToken == other.accessToken &&
        flags == other.flags;
  }
}
