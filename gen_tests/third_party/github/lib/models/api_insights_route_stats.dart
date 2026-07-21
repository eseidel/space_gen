import 'package:github/models/api_insights_route_stats_inner.dart';

/// Route Stats
/// API Insights usage route stats for an actor
extension type const ApiInsightsRouteStats._(
  List<ApiInsightsRouteStatsInner> value
) implements List<ApiInsightsRouteStatsInner> {
  const ApiInsightsRouteStats(this.value);

  factory ApiInsightsRouteStats.fromJson(List<dynamic> json) =>
      ApiInsightsRouteStats(
        json
            .map<ApiInsightsRouteStatsInner>(
              (e) => ApiInsightsRouteStatsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsRouteStats? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsRouteStats.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
