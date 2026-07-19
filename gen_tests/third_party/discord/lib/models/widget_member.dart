import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/widget_activity.dart';
import 'package:discord/models/widget_user_discriminator.dart';
import 'package:meta/meta.dart';

@immutable
class WidgetMember {
  const WidgetMember({
    required this.id,
    required this.username,
    required this.discriminator,
    required this.avatar,
    required this.status,
    required this.avatarUrl,
    this.activity,
    this.deaf,
    this.mute,
    this.selfDeaf,
    this.selfMute,
    this.suppress,
    this.channelId,
  });

  /// Converts a `Map<String, dynamic>` to a [WidgetMember].
  factory WidgetMember.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WidgetMember',
      json,
      () => WidgetMember(
        id: json['id'] as String,
        username: json['username'] as String,
        discriminator: WidgetUserDiscriminator.fromJson(
          json['discriminator'] as String,
        ),
        avatar: json['avatar'],
        status: json['status'] as String,
        avatarUrl: Uri.parse(json['avatar_url'] as String),
        activity: WidgetActivity.maybeFromJson(
          json['activity'] as Map<String, dynamic>?,
        ),
        deaf: json['deaf'] as bool?,
        mute: json['mute'] as bool?,
        selfDeaf: json['self_deaf'] as bool?,
        selfMute: json['self_mute'] as bool?,
        suppress: json['suppress'] as bool?,
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WidgetMember? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WidgetMember.fromJson(json);
  }

  final String id;
  final String username;
  final WidgetUserDiscriminator discriminator;
  final dynamic avatar;
  final String status;
  final Uri avatarUrl;
  final WidgetActivity? activity;
  final bool? deaf;
  final bool? mute;
  final bool? selfDeaf;
  final bool? selfMute;
  final bool? suppress;
  final SnowflakeType? channelId;

  /// Converts a [WidgetMember] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'discriminator': discriminator.toJson(),
      'avatar': avatar,
      'status': status,
      'avatar_url': avatarUrl.toString(),
      'activity': ?activity?.toJson(),
      'deaf': ?deaf,
      'mute': ?mute,
      'self_deaf': ?selfDeaf,
      'self_mute': ?selfMute,
      'suppress': ?suppress,
      'channel_id': ?channelId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    username,
    discriminator,
    avatar,
    status,
    avatarUrl,
    activity,
    deaf,
    mute,
    selfDeaf,
    selfMute,
    suppress,
    channelId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WidgetMember &&
        id == other.id &&
        username == other.username &&
        discriminator == other.discriminator &&
        avatar == other.avatar &&
        status == other.status &&
        avatarUrl == other.avatarUrl &&
        activity == other.activity &&
        deaf == other.deaf &&
        mute == other.mute &&
        selfDeaf == other.selfDeaf &&
        selfMute == other.selfMute &&
        suppress == other.suppress &&
        channelId == other.channelId;
  }
}
