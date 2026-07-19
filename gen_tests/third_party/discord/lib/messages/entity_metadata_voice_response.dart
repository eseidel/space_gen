import 'package:meta/meta.dart';

@immutable
class EntityMetadataVoiceResponse {
  const EntityMetadataVoiceResponse();

  /// Converts a `Map<String, dynamic>` to an [EntityMetadataVoiceResponse].
  factory EntityMetadataVoiceResponse.fromJson(Map<String, dynamic> _) {
    return const EntityMetadataVoiceResponse();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMetadataVoiceResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EntityMetadataVoiceResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
