import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CampaignSummaryAlertStats {
  const CampaignSummaryAlertStats({
    required this.openCount,
    required this.closedCount,
    required this.inProgressCount,
  });

  /// Converts a `Map<String, dynamic>` to a [CampaignSummaryAlertStats].
  factory CampaignSummaryAlertStats.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CampaignSummaryAlertStats',
      json,
      () => CampaignSummaryAlertStats(
        openCount: json['open_count'] as int,
        closedCount: json['closed_count'] as int,
        inProgressCount: json['in_progress_count'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CampaignSummaryAlertStats? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CampaignSummaryAlertStats.fromJson(json);
  }

  /// The number of open alerts
  final int openCount;

  /// The number of closed alerts
  final int closedCount;

  /// The number of in-progress alerts
  final int inProgressCount;

  /// Converts a [CampaignSummaryAlertStats] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'open_count': openCount,
      'closed_count': closedCount,
      'in_progress_count': inProgressCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([openCount, closedCount, inProgressCount]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignSummaryAlertStats &&
        openCount == other.openCount &&
        closedCount == other.closedCount &&
        inProgressCount == other.inProgressCount;
  }
}
