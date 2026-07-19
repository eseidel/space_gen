import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiInsightsTimeStatsInner {
  const ApiInsightsTimeStatsInner({
    this.timestamp,
    this.totalRequestCount,
    this.rateLimitedRequestCount,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiInsightsTimeStatsInner].
  factory ApiInsightsTimeStatsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiInsightsTimeStatsInner',
      json,
      () => ApiInsightsTimeStatsInner(
        timestamp: json['timestamp'] as String?,
        totalRequestCount: json['total_request_count'] as int?,
        rateLimitedRequestCount: json['rate_limited_request_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsTimeStatsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsTimeStatsInner.fromJson(json);
  }

  final String? timestamp;
  final int? totalRequestCount;
  final int? rateLimitedRequestCount;

  /// Converts an [ApiInsightsTimeStatsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'timestamp': ?timestamp,
      'total_request_count': ?totalRequestCount,
      'rate_limited_request_count': ?rateLimitedRequestCount,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([timestamp, totalRequestCount, rateLimitedRequestCount]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiInsightsTimeStatsInner &&
        timestamp == other.timestamp &&
        totalRequestCount == other.totalRequestCount &&
        rateLimitedRequestCount == other.rateLimitedRequestCount;
  }
}
