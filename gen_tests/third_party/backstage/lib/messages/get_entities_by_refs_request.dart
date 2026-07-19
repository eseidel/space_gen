import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GetEntitiesByRefsRequest {
  const GetEntitiesByRefsRequest({
    required this.entityRefs,
    this.fields,
    this.query,
  });

  /// Converts a `Map<String, dynamic>` to a [GetEntitiesByRefsRequest].
  factory GetEntitiesByRefsRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetEntitiesByRefsRequest',
      json,
      () => GetEntitiesByRefsRequest(
        entityRefs: (json['entityRefs'] as List).cast<String>(),
        fields: (json['fields'] as List?)?.cast<String>(),
        query: json['query'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetEntitiesByRefsRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetEntitiesByRefsRequest.fromJson(json);
  }

  final List<String> entityRefs;
  final List<String>? fields;

  /// A type representing all allowed JSON object values.
  final Map<String, dynamic>? query;

  /// Converts a [GetEntitiesByRefsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'entityRefs': entityRefs, 'fields': fields, 'query': query};
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(entityRefs), listHash(fields), mapHash(query)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetEntitiesByRefsRequest &&
        listsEqual(entityRefs, other.entityRefs) &&
        listsEqual(fields, other.fields) &&
        mapsEqual(query, other.query);
  }
}
