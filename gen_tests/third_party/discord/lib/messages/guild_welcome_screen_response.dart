import 'package:discord/messages/guild_welcome_screen_channel_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildWelcomeScreenResponse {
  const GuildWelcomeScreenResponse({
    required this.description,
    required this.welcomeChannels,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildWelcomeScreenResponse].
  factory GuildWelcomeScreenResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildWelcomeScreenResponse',
      json,
      () => GuildWelcomeScreenResponse(
        description: checkedKey(json, 'description') as String?,
        welcomeChannels: (json['welcome_channels'] as List)
            .map<GuildWelcomeScreenChannelResponse>(
              (e) => GuildWelcomeScreenChannelResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildWelcomeScreenResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildWelcomeScreenResponse.fromJson(json);
  }

  final String? description;
  final List<GuildWelcomeScreenChannelResponse> welcomeChannels;

  /// Converts a [GuildWelcomeScreenResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'welcome_channels': welcomeChannels.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([description, listHash(welcomeChannels)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildWelcomeScreenResponse &&
        description == other.description &&
        listsEqual(welcomeChannels, other.welcomeChannels);
  }
}
