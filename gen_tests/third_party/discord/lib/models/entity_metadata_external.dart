import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EntityMetadataExternal {
  const EntityMetadataExternal({required this.location});

  /// Converts a `Map<String, dynamic>` to an [EntityMetadataExternal].
  factory EntityMetadataExternal.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityMetadataExternal',
      json,
      () => EntityMetadataExternal(location: json['location'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMetadataExternal? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityMetadataExternal.fromJson(json);
  }

  final String location;

  /// Converts an [EntityMetadataExternal] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'location': location};
  }

  @override
  int get hashCode => location.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityMetadataExternal && location == other.location;
  }
}
