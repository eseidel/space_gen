import 'package:discord/messages/settings_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ResourceChannelResponse {
  const ResourceChannelResponse({
    required this.channelId,
    required this.title,
    required this.description,
    this.emoji,
    this.icon,
  });

  /// Converts a `Map<String, dynamic>` to a [ResourceChannelResponse].
  factory ResourceChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ResourceChannelResponse',
      json,
      () => ResourceChannelResponse(
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        title: json['title'] as String,
        emoji: SettingsEmojiResponse.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
        icon: json['icon'] as String?,
        description: json['description'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ResourceChannelResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ResourceChannelResponse.fromJson(json);
  }

  final SnowflakeType channelId;
  final String title;
  final SettingsEmojiResponse? emoji;
  final String? icon;
  final String description;

  /// Converts a [ResourceChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'channel_id': channelId.toJson(),
      'title': title,
      'emoji': ?emoji?.toJson(),
      'icon': ?icon,
      'description': description,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([channelId, title, emoji, icon, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ResourceChannelResponse &&
        channelId == other.channelId &&
        title == other.title &&
        emoji == other.emoji &&
        icon == other.icon &&
        description == other.description;
  }
}
