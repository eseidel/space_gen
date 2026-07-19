import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template recursive_partial_entity_relation}
/// A relation of a specific type to another entity in the catalog.
/// {@endtemplate}
@immutable
class RecursivePartialEntityRelation {
  /// {@macro recursive_partial_entity_relation}
  const RecursivePartialEntityRelation({this.targetRef, this.type});

  /// Converts a `Map<String, dynamic>` to a [RecursivePartialEntityRelation].
  factory RecursivePartialEntityRelation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RecursivePartialEntityRelation',
      json,
      () => RecursivePartialEntityRelation(
        targetRef: json['targetRef'] as String?,
        type: json['type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RecursivePartialEntityRelation? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RecursivePartialEntityRelation.fromJson(json);
  }

  /// The entity ref of the target of this relation.
  final String? targetRef;

  /// The type of the relation.
  final String? type;

  /// Converts a [RecursivePartialEntityRelation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'targetRef': targetRef, 'type': type};
  }

  @override
  int get hashCode => Object.hashAll([targetRef, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RecursivePartialEntityRelation &&
        targetRef == other.targetRef &&
        type == other.type;
  }
}
