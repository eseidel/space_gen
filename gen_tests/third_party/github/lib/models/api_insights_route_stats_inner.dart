import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiInsightsRouteStatsInner {
  const ApiInsightsRouteStatsInner({
    this.httpMethod,
    this.apiRoute,
    this.totalRequestCount,
    this.rateLimitedRequestCount,
    this.lastRateLimitedTimestamp,
    this.lastRequestTimestamp,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiInsightsRouteStatsInner].
  factory ApiInsightsRouteStatsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiInsightsRouteStatsInner',
      json,
      () => ApiInsightsRouteStatsInner(
        httpMethod: json['http_method'] as String?,
        apiRoute: json['api_route'] as String?,
        totalRequestCount: json['total_request_count'] as int?,
        rateLimitedRequestCount: json['rate_limited_request_count'] as int?,
        lastRateLimitedTimestamp:
            json['last_rate_limited_timestamp'] as String?,
        lastRequestTimestamp: json['last_request_timestamp'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsRouteStatsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsRouteStatsInner.fromJson(json);
  }

  /// The HTTP method
  final String? httpMethod;

  /// The API path's route template
  final String? apiRoute;

  /// The total number of requests within the queried time period
  final int? totalRequestCount;

  /// The total number of requests that were rate limited within the queried
  /// time period
  final int? rateLimitedRequestCount;
  final String? lastRateLimitedTimestamp;
  final String? lastRequestTimestamp;

  /// Converts an [ApiInsightsRouteStatsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (httpMethod != null) 'http_method': httpMethod,
      if (apiRoute != null) 'api_route': apiRoute,
      if (totalRequestCount != null) 'total_request_count': totalRequestCount,
      if (rateLimitedRequestCount != null)
        'rate_limited_request_count': rateLimitedRequestCount,
      'last_rate_limited_timestamp': lastRateLimitedTimestamp,
      if (lastRequestTimestamp != null)
        'last_request_timestamp': lastRequestTimestamp,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    httpMethod,
    apiRoute,
    totalRequestCount,
    rateLimitedRequestCount,
    lastRateLimitedTimestamp,
    lastRequestTimestamp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiInsightsRouteStatsInner &&
        httpMethod == other.httpMethod &&
        apiRoute == other.apiRoute &&
        totalRequestCount == other.totalRequestCount &&
        rateLimitedRequestCount == other.rateLimitedRequestCount &&
        lastRateLimitedTimestamp == other.lastRateLimitedTimestamp &&
        lastRequestTimestamp == other.lastRequestTimestamp;
  }
}
