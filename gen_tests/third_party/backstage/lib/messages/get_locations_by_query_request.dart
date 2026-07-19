import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GetLocationsByQueryRequest {
  const GetLocationsByQueryRequest({this.cursor, this.limit, this.query});

  /// Converts a `Map<String, dynamic>` to a [GetLocationsByQueryRequest].
  factory GetLocationsByQueryRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetLocationsByQueryRequest',
      json,
      () => GetLocationsByQueryRequest(
        cursor: json['cursor'] as String?,
        limit: (json['limit'] as num?)?.toDouble(),
        query: json['query'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetLocationsByQueryRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetLocationsByQueryRequest.fromJson(json);
  }

  final String? cursor;
  final double? limit;

  /// A type representing all allowed JSON object values.
  final Map<String, dynamic>? query;

  /// Converts a [GetLocationsByQueryRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (cursor != null) 'cursor': cursor,
      if (limit != null) 'limit': limit,
      if (query != null) 'query': query,
    };
  }

  @override
  int get hashCode => Object.hashAll([cursor, limit, mapHash(query)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetLocationsByQueryRequest &&
        cursor == other.cursor &&
        limit == other.limit &&
        mapsEqual(query, other.query);
  }
}
