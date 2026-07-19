import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/recursive_partial_entity_meta.dart';
import 'package:backstage/models/recursive_partial_entity_relation.dart';
import 'package:meta/meta.dart';

/// {@template recursive_partial_entity}
/// Makes all keys of an entire hierarchy optional.
/// {@endtemplate}
@immutable
class RecursivePartialEntity {
  /// {@macro recursive_partial_entity}
  const RecursivePartialEntity({
    this.apiVersion,
    this.kind,
    this.metadata,
    this.spec,
    this.relations,
  });

  /// Converts a `Map<String, dynamic>` to a [RecursivePartialEntity].
  factory RecursivePartialEntity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RecursivePartialEntity',
      json,
      () => RecursivePartialEntity(
        apiVersion: json['apiVersion'] as String?,
        kind: json['kind'] as String?,
        metadata: RecursivePartialEntityMeta.maybeFromJson(
          json['metadata'] as Map<String, dynamic>?,
        ),
        spec: json['spec'] as Map<String, dynamic>?,
        relations: (json['relations'] as List?)
            ?.map<RecursivePartialEntityRelation>(
              (e) => RecursivePartialEntityRelation.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RecursivePartialEntity? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RecursivePartialEntity.fromJson(json);
  }

  /// The version of specification format for this particular entity that
  /// this is written against.
  final String? apiVersion;

  /// The high level entity type being described.
  final String? kind;
  final RecursivePartialEntityMeta? metadata;

  /// A type representing all allowed JSON object values.
  final Map<String, dynamic>? spec;

  /// The relations that this entity has with other entities.
  final List<RecursivePartialEntityRelation>? relations;

  /// Converts a [RecursivePartialEntity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'apiVersion': apiVersion,
      'kind': kind,
      'metadata': metadata?.toJson(),
      'spec': spec,
      'relations': relations?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    apiVersion,
    kind,
    metadata,
    mapHash(spec),
    listHash(relations),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RecursivePartialEntity &&
        apiVersion == other.apiVersion &&
        kind == other.kind &&
        metadata == other.metadata &&
        mapsEqual(spec, other.spec) &&
        listsEqual(relations, other.relations);
  }
}
