import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class SearchIndexNotReadyResponse {
  const SearchIndexNotReadyResponse({
    required this.message,
    required this.code,
    required this.documentsIndexed,
    required this.retryAfter,
  });

  /// Converts a `Map<String, dynamic>` to a [SearchIndexNotReadyResponse].
  factory SearchIndexNotReadyResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SearchIndexNotReadyResponse',
      json,
      () => SearchIndexNotReadyResponse(
        message: json['message'] as String,
        code: json['code'] as int,
        documentsIndexed: json['documents_indexed'] as int,
        retryAfter: json['retry_after'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchIndexNotReadyResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SearchIndexNotReadyResponse.fromJson(json);
  }

  final String message;
  final int code;
  final int documentsIndexed;
  final int retryAfter;

  /// Converts a [SearchIndexNotReadyResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'documents_indexed': documentsIndexed,
      'retry_after': retryAfter,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, code, documentsIndexed, retryAfter]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchIndexNotReadyResponse &&
        message == other.message &&
        code == other.code &&
        documentsIndexed == other.documentsIndexed &&
        retryAfter == other.retryAfter;
  }
}
