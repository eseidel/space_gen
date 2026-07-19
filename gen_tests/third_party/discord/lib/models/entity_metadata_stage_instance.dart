import 'package:meta/meta.dart';

@immutable
class EntityMetadataStageInstance {
  const EntityMetadataStageInstance();

  /// Converts a `Map<String, dynamic>` to an [EntityMetadataStageInstance].
  factory EntityMetadataStageInstance.fromJson(Map<String, dynamic> _) {
    return const EntityMetadataStageInstance();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMetadataStageInstance? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EntityMetadataStageInstance.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
