// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/models/api_insights_user_stats_inner.dart';

/// User Stats
/// API Insights usage stats for a user
extension type const ApiInsightsUserStats._(
  List<ApiInsightsUserStatsInner> value
)
    implements List<ApiInsightsUserStatsInner> {
  const ApiInsightsUserStats(this.value);

  factory ApiInsightsUserStats.fromJson(List<dynamic> json) =>
      ApiInsightsUserStats(
        json
            .map<ApiInsightsUserStatsInner>(
              (e) =>
                  ApiInsightsUserStatsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiInsightsUserStats? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiInsightsUserStats.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
