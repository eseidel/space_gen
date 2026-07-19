import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_welcome_channel.dart';
import 'package:meta/meta.dart';

@immutable
class WelcomeScreenPatchRequestPartial {
  const WelcomeScreenPatchRequestPartial({
    this.description,
    this.welcomeChannels,
    this.enabled,
  });

  /// Converts a `Map<String, dynamic>` to a [WelcomeScreenPatchRequestPartial].
  factory WelcomeScreenPatchRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WelcomeScreenPatchRequestPartial',
      json,
      () => WelcomeScreenPatchRequestPartial(
        description: json['description'] as String?,
        welcomeChannels: (json['welcome_channels'] as List?)
            ?.map<GuildWelcomeChannel>(
              (e) => GuildWelcomeChannel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        enabled: json['enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WelcomeScreenPatchRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WelcomeScreenPatchRequestPartial.fromJson(json);
  }

  final String? description;
  final List<GuildWelcomeChannel>? welcomeChannels;
  final bool? enabled;

  /// Converts a [WelcomeScreenPatchRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'welcome_channels': welcomeChannels?.map((e) => e.toJson()).toList(),
      'enabled': enabled,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([description, listHash(welcomeChannels), enabled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WelcomeScreenPatchRequestPartial &&
        description == other.description &&
        listsEqual(welcomeChannels, other.welcomeChannels) &&
        enabled == other.enabled;
  }
}
