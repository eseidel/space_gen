import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity.dart';
import 'package:backstage/models/location.dart';
import 'package:meta/meta.dart';

@immutable
class CreateLocation201Response {
  const CreateLocation201Response({
    required this.entities,
    required this.location,
    this.exists,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateLocation201Response].
  factory CreateLocation201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateLocation201Response',
      json,
      () => CreateLocation201Response(
        exists: json['exists'] as bool?,
        entities: (json['entities'] as List)
            .map<Entity>((e) => Entity.fromJson(e as Map<String, dynamic>))
            .toList(),
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateLocation201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateLocation201Response.fromJson(json);
  }

  final bool? exists;
  final List<Entity> entities;

  /// Entity location for a specific entity.
  final Location location;

  /// Converts a [CreateLocation201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'exists': ?exists,
      'entities': entities.map((e) => e.toJson()).toList(),
      'location': location.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([exists, listHash(entities), location]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateLocation201Response &&
        exists == other.exists &&
        listsEqual(entities, other.entities) &&
        location == other.location;
  }
}
