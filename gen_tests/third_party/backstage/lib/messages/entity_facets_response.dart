import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity_facet.dart';
import 'package:meta/meta.dart';

@immutable
class EntityFacetsResponse {
  const EntityFacetsResponse({required this.facets});

  /// Converts a `Map<String, dynamic>` to an [EntityFacetsResponse].
  factory EntityFacetsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityFacetsResponse',
      json,
      () => EntityFacetsResponse(
        facets: (json['facets'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            (value as List)
                .map<EntityFacet>(
                  (e) => EntityFacet.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityFacetsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityFacetsResponse.fromJson(json);
  }

  final Map<String, List<EntityFacet>> facets;

  /// Converts an [EntityFacetsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'facets': facets.map(
        (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
      ),
    };
  }

  @override
  int get hashCode => mapHash(facets).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityFacetsResponse && mapsEqual(facets, other.facets);
  }
}
