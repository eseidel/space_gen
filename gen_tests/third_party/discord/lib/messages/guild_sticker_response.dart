import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/sticker_format_types.dart';
import 'package:discord/models/sticker_types.dart';
import 'package:meta/meta.dart';

@immutable
class GuildStickerResponse {
  const GuildStickerResponse({
    required this.id,
    required this.name,
    required this.tags,
    required this.formatType,
    required this.description,
    required this.available,
    required this.guildId,
    this.user,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildStickerResponse].
  factory GuildStickerResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildStickerResponse',
      json,
      () => GuildStickerResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        tags: json['tags'] as String,
        formatType: StickerFormatTypes.maybeFromJson(
          checkedKey(json, 'format_type') as int?,
        ),
        description: checkedKey(json, 'description') as String?,
        available: json['available'] as bool,
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildStickerResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildStickerResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String tags;
  StickerTypes get type => StickerTypes.guild;
  final StickerFormatTypes? formatType;
  final String? description;
  final bool available;
  final SnowflakeType guildId;
  final UserResponse? user;

  /// Converts a [GuildStickerResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'tags': tags,
      'type': type.toJson(),
      'format_type': formatType?.toJson(),
      'description': description,
      'available': available,
      'guild_id': guildId.toJson(),
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    tags,
    formatType,
    description,
    available,
    guildId,
    user,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildStickerResponse &&
        id == other.id &&
        name == other.name &&
        tags == other.tags &&
        formatType == other.formatType &&
        description == other.description &&
        available == other.available &&
        guildId == other.guildId &&
        user == other.user;
  }
}
