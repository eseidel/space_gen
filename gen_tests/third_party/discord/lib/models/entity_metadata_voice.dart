import 'package:meta/meta.dart';

@immutable
class EntityMetadataVoice {
  const EntityMetadataVoice();

  /// Converts a `Map<String, dynamic>` to an [EntityMetadataVoice].
  factory EntityMetadataVoice.fromJson(Map<String, dynamic> _) {
    return const EntityMetadataVoice();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMetadataVoice? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityMetadataVoice.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
