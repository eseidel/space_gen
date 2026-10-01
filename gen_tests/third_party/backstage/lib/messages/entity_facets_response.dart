// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
