import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity.dart';
import 'package:backstage/models/location_spec.dart';
import 'package:meta/meta.dart';

/// {@template analyze_location_existing_entity}
/// If the folder pointed to already contained catalog info yaml files, they are
/// read and emitted like this so that the frontend can inform the user that it
/// located them and can make sure to register them as well if they weren't
/// already
/// {@endtemplate}
@immutable
class AnalyzeLocationExistingEntity {
  /// {@macro analyze_location_existing_entity}
  const AnalyzeLocationExistingEntity({
    required this.entity,
    required this.isRegistered,
    required this.location,
  });

  /// Converts a `Map<String, dynamic>` to an [AnalyzeLocationExistingEntity].
  factory AnalyzeLocationExistingEntity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AnalyzeLocationExistingEntity',
      json,
      () => AnalyzeLocationExistingEntity(
        entity: Entity.fromJson(json['entity'] as Map<String, dynamic>),
        isRegistered: json['isRegistered'] as bool,
        location: LocationSpec.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AnalyzeLocationExistingEntity? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AnalyzeLocationExistingEntity.fromJson(json);
  }

  /// The parts of the format that's common to all versions/kinds of entity.
  final Entity entity;
  final bool isRegistered;

  /// Holds the entity location information.
  final LocationSpec location;

  /// Converts an [AnalyzeLocationExistingEntity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'entity': entity.toJson(),
      'isRegistered': isRegistered,
      'location': location.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([entity, isRegistered, location]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnalyzeLocationExistingEntity &&
        entity == other.entity &&
        isRegistered == other.isRegistered &&
        location == other.location;
  }
}
