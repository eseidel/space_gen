import 'package:discord/api_exception.dart';
import 'package:discord/messages/emoji_response.dart';
import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_features.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildPreviewResponse {
  GuildPreviewResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.homeHeader,
    required this.splash,
    required this.discoverySplash,
    required this.features,
    required this.approximateMemberCount,
    required this.approximatePresenceCount,
    required this.emojis,
    required this.stickers,
  }) {
    features.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [GuildPreviewResponse].
  factory GuildPreviewResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildPreviewResponse',
      json,
      () => GuildPreviewResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        icon: checkedKey(json, 'icon') as String?,
        description: checkedKey(json, 'description') as String?,
        homeHeader: checkedKey(json, 'home_header') as String?,
        splash: checkedKey(json, 'splash') as String?,
        discoverySplash: checkedKey(json, 'discovery_splash') as String?,
        features: (json['features'] as List)
            .map<GuildFeatures>((e) => GuildFeatures.fromJson(e as String))
            .toList(),
        approximateMemberCount: json['approximate_member_count'] as int,
        approximatePresenceCount: json['approximate_presence_count'] as int,
        emojis: (json['emojis'] as List)
            .map<EmojiResponse>(
              (e) => EmojiResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        stickers: (json['stickers'] as List)
            .map<GuildStickerResponse>(
              (e) => GuildStickerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildPreviewResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildPreviewResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? icon;
  final String? description;
  final String? homeHeader;
  final String? splash;
  final String? discoverySplash;
  final List<GuildFeatures> features;
  final int approximateMemberCount;
  final int approximatePresenceCount;
  final List<EmojiResponse> emojis;
  final List<GuildStickerResponse> stickers;

  /// Converts a [GuildPreviewResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'icon': icon,
      'description': description,
      'home_header': homeHeader,
      'splash': splash,
      'discovery_splash': discoverySplash,
      'features': features.map((e) => e.toJson()).toList(),
      'approximate_member_count': approximateMemberCount,
      'approximate_presence_count': approximatePresenceCount,
      'emojis': emojis.map((e) => e.toJson()).toList(),
      'stickers': stickers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    icon,
    description,
    homeHeader,
    splash,
    discoverySplash,
    listHash(features),
    approximateMemberCount,
    approximatePresenceCount,
    listHash(emojis),
    listHash(stickers),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildPreviewResponse &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description &&
        homeHeader == other.homeHeader &&
        splash == other.splash &&
        discoverySplash == other.discoverySplash &&
        listsEqual(features, other.features) &&
        approximateMemberCount == other.approximateMemberCount &&
        approximatePresenceCount == other.approximatePresenceCount &&
        listsEqual(emojis, other.emojis) &&
        listsEqual(stickers, other.stickers);
  }
}
