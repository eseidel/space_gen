import 'package:discord/messages/update_onboarding_prompt_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_onboarding_mode.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateGuildOnboardingRequest {
  const UpdateGuildOnboardingRequest({
    this.prompts,
    this.enabled,
    this.defaultChannelIds,
    this.mode,
  });

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildOnboardingRequest].
  factory UpdateGuildOnboardingRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildOnboardingRequest',
      json,
      () => UpdateGuildOnboardingRequest(
        prompts: (json['prompts'] as List?)
            ?.map<UpdateOnboardingPromptRequest>(
              (e) => UpdateOnboardingPromptRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        enabled: json['enabled'] as bool?,
        defaultChannelIds: (json['default_channel_ids'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        mode: GuildOnboardingMode.maybeFromJson(json['mode'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildOnboardingRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateGuildOnboardingRequest.fromJson(json);
  }

  final List<UpdateOnboardingPromptRequest>? prompts;
  final bool? enabled;
  final List<SnowflakeType>? defaultChannelIds;
  final GuildOnboardingMode? mode;

  /// Converts a [UpdateGuildOnboardingRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'prompts': prompts?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
      'default_channel_ids': defaultChannelIds?.map((e) => e.toJson()).toList(),
      'mode': mode?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(prompts),
    enabled,
    listHash(defaultChannelIds),
    mode,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildOnboardingRequest &&
        listsEqual(prompts, other.prompts) &&
        enabled == other.enabled &&
        listsEqual(defaultChannelIds, other.defaultChannelIds) &&
        mode == other.mode;
  }
}
