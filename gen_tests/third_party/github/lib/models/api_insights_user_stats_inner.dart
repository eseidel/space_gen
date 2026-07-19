import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiInsightsUserStatsInner {
  const ApiInsightsUserStatsInner({
    this.actorType,
    this.actorName,
    this.actorId,
    this.integrationId,
    this.oauthApplicationId,
    this.totalRequestCount,
    this.rateLimitedRequestCount,
    this.lastRateLimitedTimestamp,
    this.lastRequestTimestamp,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiInsightsUserStatsInner].
  factory ApiInsightsUserStatsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiInsightsUserStatsInner',
      json,
      () => ApiInsightsUserStatsInner(
        actorType: json['actor_type'] as String?,
        actorName: json['actor_name'] as String?,
        actorId: json['actor_id'] as int?,
        integrationId: json['integration_id'] as int?,
        oauthApplicationId: json['oauth_application_id'] as int?,
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
  static ApiInsightsUserStatsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsUserStatsInner.fromJson(json);
  }

  final String? actorType;
  final String? actorName;
  final int? actorId;
  final int? integrationId;
  final int? oauthApplicationId;
  final int? totalRequestCount;
  final int? rateLimitedRequestCount;
  final String? lastRateLimitedTimestamp;
  final String? lastRequestTimestamp;

  /// Converts an [ApiInsightsUserStatsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (actorType != null) 'actor_type': actorType,
      if (actorName != null) 'actor_name': actorName,
      if (actorId != null) 'actor_id': actorId,
      'integration_id': integrationId,
      'oauth_application_id': oauthApplicationId,
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
    actorType,
    actorName,
    actorId,
    integrationId,
    oauthApplicationId,
    totalRequestCount,
    rateLimitedRequestCount,
    lastRateLimitedTimestamp,
    lastRequestTimestamp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiInsightsUserStatsInner &&
        actorType == other.actorType &&
        actorName == other.actorName &&
        actorId == other.actorId &&
        integrationId == other.integrationId &&
        oauthApplicationId == other.oauthApplicationId &&
        totalRequestCount == other.totalRequestCount &&
        rateLimitedRequestCount == other.rateLimitedRequestCount &&
        lastRateLimitedTimestamp == other.lastRateLimitedTimestamp &&
        lastRequestTimestamp == other.lastRequestTimestamp;
  }
}
