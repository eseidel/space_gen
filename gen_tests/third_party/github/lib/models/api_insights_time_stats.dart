import 'package:github/models/api_insights_time_stats_inner.dart';

/// Time Stats
/// API Insights usage time stats for an organization
extension type const ApiInsightsTimeStats._(
  List<ApiInsightsTimeStatsInner> value
) implements List<ApiInsightsTimeStatsInner> {
  const ApiInsightsTimeStats(this.value);

  factory ApiInsightsTimeStats.fromJson(List<dynamic> json) =>
      ApiInsightsTimeStats(
        json
            .map<ApiInsightsTimeStatsInner>(
              (e) =>
                  ApiInsightsTimeStatsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsTimeStats? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsTimeStats.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
