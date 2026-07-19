import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiInsightsSubjectStatsInner {
  const ApiInsightsSubjectStatsInner({
    this.subjectType,
    this.subjectName,
    this.subjectId,
    this.totalRequestCount,
    this.rateLimitedRequestCount,
    this.lastRateLimitedTimestamp,
    this.lastRequestTimestamp,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiInsightsSubjectStatsInner].
  factory ApiInsightsSubjectStatsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiInsightsSubjectStatsInner',
      json,
      () => ApiInsightsSubjectStatsInner(
        subjectType: json['subject_type'] as String?,
        subjectName: json['subject_name'] as String?,
        subjectId: json['subject_id'] as int?,
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
  static ApiInsightsSubjectStatsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApiInsightsSubjectStatsInner.fromJson(json);
  }

  final String? subjectType;
  final String? subjectName;
  final int? subjectId;
  final int? totalRequestCount;
  final int? rateLimitedRequestCount;
  final String? lastRateLimitedTimestamp;
  final String? lastRequestTimestamp;

  /// Converts an [ApiInsightsSubjectStatsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (subjectType != null) 'subject_type': subjectType,
      if (subjectName != null) 'subject_name': subjectName,
      if (subjectId != null) 'subject_id': subjectId,
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
    subjectType,
    subjectName,
    subjectId,
    totalRequestCount,
    rateLimitedRequestCount,
    lastRateLimitedTimestamp,
    lastRequestTimestamp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiInsightsSubjectStatsInner &&
        subjectType == other.subjectType &&
        subjectName == other.subjectName &&
        subjectId == other.subjectId &&
        totalRequestCount == other.totalRequestCount &&
        rateLimitedRequestCount == other.rateLimitedRequestCount &&
        lastRateLimitedTimestamp == other.lastRateLimitedTimestamp &&
        lastRequestTimestamp == other.lastRequestTimestamp;
  }
}
