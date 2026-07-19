import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template entity_relation}
/// A relation of a specific type to another entity in the catalog.
/// {@endtemplate}
@immutable
class EntityRelation {
  /// {@macro entity_relation}
  const EntityRelation({required this.targetRef, required this.type});

  /// Converts a `Map<String, dynamic>` to an [EntityRelation].
  factory EntityRelation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityRelation',
      json,
      () => EntityRelation(
        targetRef: json['targetRef'] as String,
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityRelation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityRelation.fromJson(json);
  }

  /// The entity ref of the target of this relation.
  final String targetRef;

  /// The type of the relation.
  final String type;

  /// Converts an [EntityRelation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'targetRef': targetRef, 'type': type};
  }

  @override
  int get hashCode => Object.hashAll([targetRef, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityRelation &&
        targetRef == other.targetRef &&
        type == other.type;
  }
}
