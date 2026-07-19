import 'package:github/model_helpers.dart';
import 'package:github/models/actions_billing_usage_minutes_used_breakdown.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsBillingUsage {
  const ActionsBillingUsage({
    required this.totalMinutesUsed,
    required this.totalPaidMinutesUsed,
    required this.includedMinutes,
    required this.minutesUsedBreakdown,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsBillingUsage].
  factory ActionsBillingUsage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsBillingUsage',
      json,
      () => ActionsBillingUsage(
        totalMinutesUsed: json['total_minutes_used'] as int,
        totalPaidMinutesUsed: json['total_paid_minutes_used'] as int,
        includedMinutes: json['included_minutes'] as int,
        minutesUsedBreakdown: ActionsBillingUsageMinutesUsedBreakdown.fromJson(
          json['minutes_used_breakdown'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsBillingUsage? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsBillingUsage.fromJson(json);
  }

  /// The sum of the free and paid GitHub Actions minutes used.
  final int totalMinutesUsed;

  /// The total paid GitHub Actions minutes used.
  final int totalPaidMinutesUsed;

  /// The amount of free GitHub Actions minutes available.
  final int includedMinutes;
  final ActionsBillingUsageMinutesUsedBreakdown minutesUsedBreakdown;

  /// Converts an [ActionsBillingUsage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_minutes_used': totalMinutesUsed,
      'total_paid_minutes_used': totalPaidMinutesUsed,
      'included_minutes': includedMinutes,
      'minutes_used_breakdown': minutesUsedBreakdown.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    totalMinutesUsed,
    totalPaidMinutesUsed,
    includedMinutes,
    minutesUsedBreakdown,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsBillingUsage &&
        totalMinutesUsed == other.totalMinutesUsed &&
        totalPaidMinutesUsed == other.totalPaidMinutesUsed &&
        includedMinutes == other.includedMinutes &&
        minutesUsedBreakdown == other.minutesUsedBreakdown;
  }
}
