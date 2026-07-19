import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template api_insights_summary_stats}
/// Summary Stats
/// API Insights usage summary stats for an organization
/// {@endtemplate}
@immutable
class ApiInsightsSummaryStats {
  /// {@macro api_insights_summary_stats}
  const ApiInsightsSummaryStats({
    this.totalRequestCount,
    this.rateLimitedRequestCount,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiInsightsSummaryStats].
  factory ApiInsightsSummaryStats.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiInsightsSummaryStats',
      json,
      () => ApiInsightsSummaryStats(
        totalRequestCount: json['total_request_count'] as int?,
        rateLimitedRequestCount: json['rate_limited_request_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsSummaryStats? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsSummaryStats.fromJson(json);
  }

  /// The total number of requests within the queried time period
  final int? totalRequestCount;

  /// The total number of requests that were rate limited within the queried
  /// time period
  final int? rateLimitedRequestCount;

  /// Converts an [ApiInsightsSummaryStats] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_request_count': ?totalRequestCount,
      'rate_limited_request_count': ?rateLimitedRequestCount,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalRequestCount, rateLimitedRequestCount]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiInsightsSummaryStats &&
        totalRequestCount == other.totalRequestCount &&
        rateLimitedRequestCount == other.rateLimitedRequestCount;
  }
}
