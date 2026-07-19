import 'package:discord/messages/onboarding_prompt_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_onboarding_mode.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildOnboardingResponse {
  const GuildOnboardingResponse({
    required this.guildId,
    required this.prompts,
    required this.defaultChannelIds,
    required this.enabled,
    required this.mode,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildOnboardingResponse].
  factory GuildOnboardingResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildOnboardingResponse',
      json,
      () => GuildOnboardingResponse(
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        prompts: (json['prompts'] as List)
            .map<OnboardingPromptResponse>(
              (e) =>
                  OnboardingPromptResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        defaultChannelIds: (json['default_channel_ids'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        enabled: json['enabled'] as bool,
        mode: GuildOnboardingMode.fromJson(json['mode'] as int),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildOnboardingResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildOnboardingResponse.fromJson(json);
  }

  final SnowflakeType guildId;
  final List<OnboardingPromptResponse> prompts;
  final List<SnowflakeType> defaultChannelIds;
  final bool enabled;
  final GuildOnboardingMode mode;

  /// Converts a [GuildOnboardingResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'guild_id': guildId.toJson(),
      'prompts': prompts.map((e) => e.toJson()).toList(),
      'default_channel_ids': defaultChannelIds.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'mode': mode.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    guildId,
    listHash(prompts),
    listHash(defaultChannelIds),
    enabled,
    mode,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildOnboardingResponse &&
        guildId == other.guildId &&
        listsEqual(prompts, other.prompts) &&
        listsEqual(defaultChannelIds, other.defaultChannelIds) &&
        enabled == other.enabled &&
        mode == other.mode;
  }
}
