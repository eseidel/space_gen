import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/query_entities_by_predicate_request_order_by_inner_order.dart';
import 'package:meta/meta.dart';

@immutable
class QueryEntitiesByPredicateRequestOrderByInner {
  const QueryEntitiesByPredicateRequestOrderByInner({
    required this.field,
    required this.order,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [QueryEntitiesByPredicateRequestOrderByInner].
  factory QueryEntitiesByPredicateRequestOrderByInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'QueryEntitiesByPredicateRequestOrderByInner',
      json,
      () => QueryEntitiesByPredicateRequestOrderByInner(
        field: json['field'] as String,
        order: QueryEntitiesByPredicateRequestOrderByInnerOrder.fromJson(
          json['order'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QueryEntitiesByPredicateRequestOrderByInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QueryEntitiesByPredicateRequestOrderByInner.fromJson(json);
  }

  final String field;
  final QueryEntitiesByPredicateRequestOrderByInnerOrder order;

  /// Converts a [QueryEntitiesByPredicateRequestOrderByInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'field': field, 'order': order.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([field, order]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QueryEntitiesByPredicateRequestOrderByInner &&
        field == other.field &&
        order == other.order;
  }
}
