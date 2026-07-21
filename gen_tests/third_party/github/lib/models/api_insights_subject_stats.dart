import 'package:github/models/api_insights_subject_stats_inner.dart';

/// Subject Stats
/// API Insights usage subject stats for an organization
extension type const ApiInsightsSubjectStats._(
  List<ApiInsightsSubjectStatsInner> value
) implements List<ApiInsightsSubjectStatsInner> {
  const ApiInsightsSubjectStats(this.value);

  factory ApiInsightsSubjectStats.fromJson(List<dynamic> json) =>
      ApiInsightsSubjectStats(
        json
            .map<ApiInsightsSubjectStatsInner>(
              (e) => ApiInsightsSubjectStatsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsSubjectStats? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsSubjectStats.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
