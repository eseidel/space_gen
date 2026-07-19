import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity.dart';
import 'package:meta/meta.dart';

@immutable
class EntityAncestryResponseItemsInner {
  const EntityAncestryResponseItemsInner({
    required this.parentEntityRefs,
    required this.entity,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [EntityAncestryResponseItemsInner].
  factory EntityAncestryResponseItemsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityAncestryResponseItemsInner',
      json,
      () => EntityAncestryResponseItemsInner(
        parentEntityRefs: (json['parentEntityRefs'] as List).cast<String>(),
        entity: Entity.fromJson(json['entity'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityAncestryResponseItemsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EntityAncestryResponseItemsInner.fromJson(json);
  }

  final List<String> parentEntityRefs;

  /// The parts of the format that's common to all versions/kinds of entity.
  final Entity entity;

  /// Converts an [EntityAncestryResponseItemsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'parentEntityRefs': parentEntityRefs, 'entity': entity.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([listHash(parentEntityRefs), entity]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityAncestryResponseItemsInner &&
        listsEqual(parentEntityRefs, other.parentEntityRefs) &&
        entity == other.entity;
  }
}
