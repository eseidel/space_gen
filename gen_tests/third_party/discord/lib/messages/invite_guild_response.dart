import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_features.dart';
import 'package:discord/models/guild_nsfw_content_level.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/verification_levels.dart';
import 'package:meta/meta.dart';

@immutable
class InviteGuildResponse {
  const InviteGuildResponse({
    required this.id,
    required this.name,
    required this.splash,
    required this.banner,
    required this.description,
    required this.icon,
    required this.features,
    required this.verificationLevel,
    required this.vanityUrlCode,
    required this.nsfwLevel,
    required this.nsfw,
    required this.premiumSubscriptionCount,
  });

  /// Converts a `Map<String, dynamic>` to an [InviteGuildResponse].
  factory InviteGuildResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InviteGuildResponse',
      json,
      () => InviteGuildResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        splash: checkedKey(json, 'splash') as String?,
        banner: checkedKey(json, 'banner') as String?,
        description: checkedKey(json, 'description') as String?,
        icon: checkedKey(json, 'icon') as String?,
        features: (json['features'] as List)
            .map<GuildFeatures>((e) => GuildFeatures.fromJson(e as String))
            .toList(),
        verificationLevel: VerificationLevels.maybeFromJson(
          checkedKey(json, 'verification_level') as int?,
        ),
        vanityUrlCode: checkedKey(json, 'vanity_url_code') as String?,
        nsfwLevel: GuildNsfwContentLevel.maybeFromJson(
          checkedKey(json, 'nsfw_level') as int?,
        ),
        nsfw: checkedKey(json, 'nsfw') as bool?,
        premiumSubscriptionCount: json['premium_subscription_count'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InviteGuildResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InviteGuildResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? splash;
  final String? banner;
  final String? description;
  final String? icon;
  final List<GuildFeatures> features;
  final VerificationLevels? verificationLevel;
  final String? vanityUrlCode;
  final GuildNsfwContentLevel? nsfwLevel;
  final bool? nsfw;
  final int premiumSubscriptionCount;

  /// Converts an [InviteGuildResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'splash': splash,
      'banner': banner,
      'description': description,
      'icon': icon,
      'features': features.map((e) => e.toJson()).toList(),
      'verification_level': verificationLevel?.toJson(),
      'vanity_url_code': vanityUrlCode,
      'nsfw_level': nsfwLevel?.toJson(),
      'nsfw': nsfw,
      'premium_subscription_count': premiumSubscriptionCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    splash,
    banner,
    description,
    icon,
    listHash(features),
    verificationLevel,
    vanityUrlCode,
    nsfwLevel,
    nsfw,
    premiumSubscriptionCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InviteGuildResponse &&
        id == other.id &&
        name == other.name &&
        splash == other.splash &&
        banner == other.banner &&
        description == other.description &&
        icon == other.icon &&
        listsEqual(features, other.features) &&
        verificationLevel == other.verificationLevel &&
        vanityUrlCode == other.vanityUrlCode &&
        nsfwLevel == other.nsfwLevel &&
        nsfw == other.nsfw &&
        premiumSubscriptionCount == other.premiumSubscriptionCount;
  }
}
