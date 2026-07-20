import 'dart:convert';
import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class SoundboardCreateRequest {
  SoundboardCreateRequest({
    required this.name,
    required this.sound,
    this.volume,
    this.emojiId,
    this.emojiName,
  }) {
    name.validate(minLength: 2, maxLength: 32);
    volume?.validate(min: 0.0, max: 1.0);
    emojiName?.validate(minLength: 1, maxLength: 32);
  }

  /// Converts a `Map<String, dynamic>` to a [SoundboardCreateRequest].
  factory SoundboardCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SoundboardCreateRequest',
      json,
      () => SoundboardCreateRequest(
        name: json['name'] as String,
        volume: (json['volume'] as num?)?.toDouble(),
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
        sound: base64.decode(json['sound'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SoundboardCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SoundboardCreateRequest.fromJson(json);
  }

  final String name;
  final double? volume;
  final SnowflakeType? emojiId;
  final String? emojiName;
  final Uint8List sound;

  /// Converts a [SoundboardCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'volume': volume,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
      'sound': base64.encode(sound),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, volume, emojiId, emojiName, listHash(sound)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SoundboardCreateRequest &&
        name == other.name &&
        volume == other.volume &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName &&
        listsEqual(sound, other.sound);
  }
}
