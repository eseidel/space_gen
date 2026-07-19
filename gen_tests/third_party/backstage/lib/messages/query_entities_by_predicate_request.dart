import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/query_entities_by_predicate_request_full_text_filter.dart';
import 'package:backstage/models/query_entities_by_predicate_request_order_by_inner.dart';
import 'package:backstage/models/query_entities_by_predicate_request_total_items.dart';
import 'package:meta/meta.dart';

@immutable
class QueryEntitiesByPredicateRequest {
  const QueryEntitiesByPredicateRequest({
    this.cursor,
    this.limit,
    this.offset,
    this.orderBy,
    this.fullTextFilter,
    this.fields,
    this.totalItems,
    this.query,
  });

  /// Converts a `Map<String, dynamic>` to a [QueryEntitiesByPredicateRequest].
  factory QueryEntitiesByPredicateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'QueryEntitiesByPredicateRequest',
      json,
      () => QueryEntitiesByPredicateRequest(
        cursor: json['cursor'] as String?,
        limit: (json['limit'] as num?)?.toDouble(),
        offset: (json['offset'] as num?)?.toDouble(),
        orderBy: (json['orderBy'] as List?)
            ?.map<QueryEntitiesByPredicateRequestOrderByInner>(
              (e) => QueryEntitiesByPredicateRequestOrderByInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        fullTextFilter:
            QueryEntitiesByPredicateRequestFullTextFilter.maybeFromJson(
              json['fullTextFilter'] as Map<String, dynamic>?,
            ),
        fields: (json['fields'] as List?)?.cast<String>(),
        totalItems: QueryEntitiesByPredicateRequestTotalItems.maybeFromJson(
          json['totalItems'] as String?,
        ),
        query: json['query'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QueryEntitiesByPredicateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QueryEntitiesByPredicateRequest.fromJson(json);
  }

  final String? cursor;
  final double? limit;
  final double? offset;
  final List<QueryEntitiesByPredicateRequestOrderByInner>? orderBy;
  final QueryEntitiesByPredicateRequestFullTextFilter? fullTextFilter;
  final List<String>? fields;

  /// Controls whether the response's `totalItems` field is
  /// computed. Pass `exclude` to skip the count when the caller
  /// doesn't need it. Defaults to `include`.
  final QueryEntitiesByPredicateRequestTotalItems? totalItems;

  /// A type representing all allowed JSON object values.
  final Map<String, dynamic>? query;

  /// Converts a [QueryEntitiesByPredicateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (cursor != null) 'cursor': cursor,
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
      if (orderBy != null) 'orderBy': orderBy?.map((e) => e.toJson()).toList(),
      if (fullTextFilter != null) 'fullTextFilter': fullTextFilter?.toJson(),
      if (fields != null) 'fields': fields,
      if (totalItems != null) 'totalItems': totalItems?.toJson(),
      if (query != null) 'query': query,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    cursor,
    limit,
    offset,
    listHash(orderBy),
    fullTextFilter,
    listHash(fields),
    totalItems,
    mapHash(query),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QueryEntitiesByPredicateRequest &&
        cursor == other.cursor &&
        limit == other.limit &&
        offset == other.offset &&
        listsEqual(orderBy, other.orderBy) &&
        fullTextFilter == other.fullTextFilter &&
        listsEqual(fields, other.fields) &&
        totalItems == other.totalItems &&
        mapsEqual(query, other.query);
  }
}
