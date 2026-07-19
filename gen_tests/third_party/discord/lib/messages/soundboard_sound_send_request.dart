import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class SoundboardSoundSendRequest {
  const SoundboardSoundSendRequest({required this.soundId, this.sourceGuildId});

  /// Converts a `Map<String, dynamic>` to a [SoundboardSoundSendRequest].
  factory SoundboardSoundSendRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SoundboardSoundSendRequest',
      json,
      () => SoundboardSoundSendRequest(
        soundId: SnowflakeType.fromJson(json['sound_id'] as String),
        sourceGuildId: SnowflakeType.maybeFromJson(
          json['source_guild_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SoundboardSoundSendRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SoundboardSoundSendRequest.fromJson(json);
  }

  final SnowflakeType soundId;
  final SnowflakeType? sourceGuildId;

  /// Converts a [SoundboardSoundSendRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sound_id': soundId.toJson(),
      'source_guild_id': sourceGuildId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([soundId, sourceGuildId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SoundboardSoundSendRequest &&
        soundId == other.soundId &&
        sourceGuildId == other.sourceGuildId;
  }
}
