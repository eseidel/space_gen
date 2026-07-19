import 'package:discord/messages/settings_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class OnboardingPromptOptionResponse {
  const OnboardingPromptOptionResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.roleIds,
    required this.channelIds,
  });

  /// Converts a `Map<String, dynamic>` to an [OnboardingPromptOptionResponse].
  factory OnboardingPromptOptionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OnboardingPromptOptionResponse',
      json,
      () => OnboardingPromptOptionResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        title: json['title'] as String,
        description: json['description'] as String,
        emoji: SettingsEmojiResponse.fromJson(
          json['emoji'] as Map<String, dynamic>,
        ),
        roleIds: (json['role_ids'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        channelIds: (json['channel_ids'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OnboardingPromptOptionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OnboardingPromptOptionResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String title;
  final String description;
  final SettingsEmojiResponse emoji;
  final List<SnowflakeType> roleIds;
  final List<SnowflakeType> channelIds;

  /// Converts an [OnboardingPromptOptionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'title': title,
      'description': description,
      'emoji': emoji.toJson(),
      'role_ids': roleIds.map((e) => e.toJson()).toList(),
      'channel_ids': channelIds.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    description,
    emoji,
    listHash(roleIds),
    listHash(channelIds),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OnboardingPromptOptionResponse &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        emoji == other.emoji &&
        listsEqual(roleIds, other.roleIds) &&
        listsEqual(channelIds, other.channelIds);
  }
}
