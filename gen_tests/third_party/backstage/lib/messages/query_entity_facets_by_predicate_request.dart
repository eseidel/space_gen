import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class QueryEntityFacetsByPredicateRequest {
  const QueryEntityFacetsByPredicateRequest({required this.facets, this.query});

  /// Converts a `Map<String, dynamic>` to a
  /// [QueryEntityFacetsByPredicateRequest].
  factory QueryEntityFacetsByPredicateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'QueryEntityFacetsByPredicateRequest',
      json,
      () => QueryEntityFacetsByPredicateRequest(
        facets: (json['facets'] as List).cast<String>(),
        query: json['query'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QueryEntityFacetsByPredicateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QueryEntityFacetsByPredicateRequest.fromJson(json);
  }

  final List<String> facets;

  /// A type representing all allowed JSON object values.
  final Map<String, dynamic>? query;

  /// Converts a [QueryEntityFacetsByPredicateRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'facets': facets, 'query': ?query};
  }

  @override
  int get hashCode => Object.hashAll([listHash(facets), mapHash(query)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QueryEntityFacetsByPredicateRequest &&
        listsEqual(facets, other.facets) &&
        mapsEqual(query, other.query);
  }
}
