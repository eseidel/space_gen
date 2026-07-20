import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class OnboardingPromptOptionRequest {
  OnboardingPromptOptionRequest({
    required this.title,
    this.id,
    this.description,
    this.emojiId,
    this.emojiName,
    this.emojiAnimated,
    this.roleIds,
    this.channelIds,
  }) {
    title.validate(minLength: 1, maxLength: 50);
    description?.validate(maxLength: 100);
    emojiName?.validate(maxLength: 100);
    roleIds?.validate(maxItems: 50, unique: true);
    channelIds?.validate(maxItems: 50, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to an [OnboardingPromptOptionRequest].
  factory OnboardingPromptOptionRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OnboardingPromptOptionRequest',
      json,
      () => OnboardingPromptOptionRequest(
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
        title: json['title'] as String,
        description: json['description'] as String?,
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
        emojiAnimated: json['emoji_animated'] as bool?,
        roleIds: (json['role_ids'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        channelIds: (json['channel_ids'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OnboardingPromptOptionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OnboardingPromptOptionRequest.fromJson(json);
  }

  final SnowflakeType? id;
  final String title;
  final String? description;
  final SnowflakeType? emojiId;
  final String? emojiName;
  final bool? emojiAnimated;
  final List<SnowflakeType>? roleIds;
  final List<SnowflakeType>? channelIds;

  /// Converts an [OnboardingPromptOptionRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toJson(),
      'title': title,
      'description': description,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
      'emoji_animated': emojiAnimated,
      'role_ids': roleIds?.map((e) => e.toJson()).toList(),
      'channel_ids': channelIds?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    description,
    emojiId,
    emojiName,
    emojiAnimated,
    listHash(roleIds),
    listHash(channelIds),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OnboardingPromptOptionRequest &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName &&
        emojiAnimated == other.emojiAnimated &&
        listsEqual(roleIds, other.roleIds) &&
        listsEqual(channelIds, other.channelIds);
  }
}
