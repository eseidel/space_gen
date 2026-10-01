// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/models/api_insights_time_stats_inner.dart';

/// Time Stats
/// API Insights usage time stats for an organization
extension type const ApiInsightsTimeStats._(
  List<ApiInsightsTimeStatsInner> value
)
    implements List<ApiInsightsTimeStatsInner> {
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
