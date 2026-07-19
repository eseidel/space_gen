import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class SoundboardSoundResponse {
  const SoundboardSoundResponse({
    required this.name,
    required this.soundId,
    required this.volume,
    required this.emojiId,
    required this.emojiName,
    required this.available,
    this.guildId,
    this.user,
  });

  /// Converts a `Map<String, dynamic>` to a [SoundboardSoundResponse].
  factory SoundboardSoundResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SoundboardSoundResponse',
      json,
      () => SoundboardSoundResponse(
        name: json['name'] as String,
        soundId: SnowflakeType.fromJson(json['sound_id'] as String),
        volume: (json['volume'] as num).toDouble(),
        emojiId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'emoji_id') as String?,
        ),
        emojiName: checkedKey(json, 'emoji_name') as String?,
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
        available: json['available'] as bool,
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SoundboardSoundResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SoundboardSoundResponse.fromJson(json);
  }

  final String name;
  final SnowflakeType soundId;
  final double volume;
  final SnowflakeType? emojiId;
  final String? emojiName;
  final SnowflakeType? guildId;
  final bool available;
  final UserResponse? user;

  /// Converts a [SoundboardSoundResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sound_id': soundId.toJson(),
      'volume': volume,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
      'guild_id': guildId?.toJson(),
      'available': available,
      'user': user?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    soundId,
    volume,
    emojiId,
    emojiName,
    guildId,
    available,
    user,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SoundboardSoundResponse &&
        name == other.name &&
        soundId == other.soundId &&
        volume == other.volume &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName &&
        guildId == other.guildId &&
        available == other.available &&
        user == other.user;
  }
}
