import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EntityMetadataExternalResponse {
  const EntityMetadataExternalResponse({required this.location});

  /// Converts a `Map<String, dynamic>` to an [EntityMetadataExternalResponse].
  factory EntityMetadataExternalResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityMetadataExternalResponse',
      json,
      () =>
          EntityMetadataExternalResponse(location: json['location'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMetadataExternalResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EntityMetadataExternalResponse.fromJson(json);
  }

  final String location;

  /// Converts an [EntityMetadataExternalResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'location': location};
  }

  @override
  int get hashCode => location.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityMetadataExternalResponse &&
        location == other.location;
  }
}
