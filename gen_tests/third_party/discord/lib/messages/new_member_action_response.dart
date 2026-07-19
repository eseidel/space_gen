import 'package:discord/messages/settings_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/new_member_action_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class NewMemberActionResponse {
  const NewMemberActionResponse({
    required this.channelId,
    required this.actionType,
    required this.title,
    required this.description,
    this.emoji,
    this.icon,
  });

  /// Converts a `Map<String, dynamic>` to a [NewMemberActionResponse].
  factory NewMemberActionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NewMemberActionResponse',
      json,
      () => NewMemberActionResponse(
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        actionType: NewMemberActionType.fromJson(json['action_type'] as int),
        title: json['title'] as String,
        description: json['description'] as String,
        emoji: SettingsEmojiResponse.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
        icon: json['icon'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NewMemberActionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NewMemberActionResponse.fromJson(json);
  }

  final SnowflakeType channelId;
  final NewMemberActionType actionType;
  final String title;
  final String description;
  final SettingsEmojiResponse? emoji;
  final String? icon;

  /// Converts a [NewMemberActionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'channel_id': channelId.toJson(),
      'action_type': actionType.toJson(),
      'title': title,
      'description': description,
      'emoji': emoji?.toJson(),
      'icon': icon,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([channelId, actionType, title, description, emoji, icon]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NewMemberActionResponse &&
        channelId == other.channelId &&
        actionType == other.actionType &&
        title == other.title &&
        description == other.description &&
        emoji == other.emoji &&
        icon == other.icon;
  }
}
