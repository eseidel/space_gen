import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity_meta.dart';
import 'package:backstage/models/entity_relation.dart';
import 'package:meta/meta.dart';

/// {@template entity}
/// The parts of the format that's common to all versions/kinds of entity.
/// {@endtemplate}
@immutable
class Entity {
  /// {@macro entity}
  const Entity({
    required this.metadata,
    required this.kind,
    required this.apiVersion,
    this.relations,
    this.spec,
  });

  /// Converts a `Map<String, dynamic>` to an [Entity].
  factory Entity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Entity',
      json,
      () => Entity(
        relations: (json['relations'] as List?)
            ?.map<EntityRelation>(
              (e) => EntityRelation.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        spec: json['spec'] as Map<String, dynamic>?,
        metadata: EntityMeta.fromJson(json['metadata'] as Map<String, dynamic>),
        kind: json['kind'] as String,
        apiVersion: json['apiVersion'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Entity? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Entity.fromJson(json);
  }

  /// The relations that this entity has with other entities.
  final List<EntityRelation>? relations;

  /// A type representing all allowed JSON object values.
  final Map<String, dynamic>? spec;

  /// Metadata fields common to all versions/kinds of entity.
  final EntityMeta metadata;

  /// The high level entity type being described.
  final String kind;

  /// The version of specification format for this particular entity that
  /// this is written against.
  final String apiVersion;

  /// Converts an [Entity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'relations': relations?.map((e) => e.toJson()).toList(),
      'spec': spec,
      'metadata': metadata.toJson(),
      'kind': kind,
      'apiVersion': apiVersion,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(relations),
    mapHash(spec),
    metadata,
    kind,
    apiVersion,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Entity &&
        listsEqual(relations, other.relations) &&
        mapsEqual(spec, other.spec) &&
        metadata == other.metadata &&
        kind == other.kind &&
        apiVersion == other.apiVersion;
  }
}
