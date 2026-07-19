import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphSpdxSbomSbomRelationshipsInner {
  const DependencyGraphSpdxSbomSbomRelationshipsInner({
    this.relationshipType,
    this.spdxElementId,
    this.relatedSpdxElement,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependencyGraphSpdxSbomSbomRelationshipsInner].
  factory DependencyGraphSpdxSbomSbomRelationshipsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependencyGraphSpdxSbomSbomRelationshipsInner',
      json,
      () => DependencyGraphSpdxSbomSbomRelationshipsInner(
        relationshipType: json['relationshipType'] as String?,
        spdxElementId: json['spdxElementId'] as String?,
        relatedSpdxElement: json['relatedSpdxElement'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphSpdxSbomSbomRelationshipsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependencyGraphSpdxSbomSbomRelationshipsInner.fromJson(json);
  }

  /// The type of relationship between the two SPDX elements.
  /// Example: `'DEPENDS_ON'`
  final String? relationshipType;

  /// The SPDX identifier of the package that is the source of the
  /// relationship.
  final String? spdxElementId;

  /// The SPDX identifier of the package that is the target of the
  /// relationship.
  final String? relatedSpdxElement;

  /// Converts a [DependencyGraphSpdxSbomSbomRelationshipsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (relationshipType != null) 'relationshipType': relationshipType,
      if (spdxElementId != null) 'spdxElementId': spdxElementId,
      if (relatedSpdxElement != null) 'relatedSpdxElement': relatedSpdxElement,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([relationshipType, spdxElementId, relatedSpdxElement]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphSpdxSbomSbomRelationshipsInner &&
        relationshipType == other.relationshipType &&
        spdxElementId == other.spdxElementId &&
        relatedSpdxElement == other.relatedSpdxElement;
  }
}
