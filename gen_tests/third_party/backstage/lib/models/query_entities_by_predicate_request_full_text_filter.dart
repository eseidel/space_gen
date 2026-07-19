import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class QueryEntitiesByPredicateRequestFullTextFilter {
  const QueryEntitiesByPredicateRequestFullTextFilter({this.term, this.fields});

  /// Converts a `Map<String, dynamic>` to a
  /// [QueryEntitiesByPredicateRequestFullTextFilter].
  factory QueryEntitiesByPredicateRequestFullTextFilter.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'QueryEntitiesByPredicateRequestFullTextFilter',
      json,
      () => QueryEntitiesByPredicateRequestFullTextFilter(
        term: json['term'] as String?,
        fields: (json['fields'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QueryEntitiesByPredicateRequestFullTextFilter? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QueryEntitiesByPredicateRequestFullTextFilter.fromJson(json);
  }

  final String? term;
  final List<String>? fields;

  /// Converts a [QueryEntitiesByPredicateRequestFullTextFilter]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'term': term, 'fields': fields};
  }

  @override
  int get hashCode => Object.hashAll([term, listHash(fields)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QueryEntitiesByPredicateRequestFullTextFilter &&
        term == other.term &&
        listsEqual(fields, other.fields);
  }
}
