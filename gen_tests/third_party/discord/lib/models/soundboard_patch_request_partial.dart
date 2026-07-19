import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class SoundboardPatchRequestPartial {
  const SoundboardPatchRequestPartial({
    this.name,
    this.volume,
    this.emojiId,
    this.emojiName,
  });

  /// Converts a `Map<String, dynamic>` to a [SoundboardPatchRequestPartial].
  factory SoundboardPatchRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SoundboardPatchRequestPartial',
      json,
      () => SoundboardPatchRequestPartial(
        name: json['name'] as String?,
        volume: (json['volume'] as num?)?.toDouble(),
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SoundboardPatchRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SoundboardPatchRequestPartial.fromJson(json);
  }

  final String? name;
  final double? volume;
  final SnowflakeType? emojiId;
  final String? emojiName;

  /// Converts a [SoundboardPatchRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'volume': volume,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, volume, emojiId, emojiName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SoundboardPatchRequestPartial &&
        name == other.name &&
        volume == other.volume &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName;
  }
}
