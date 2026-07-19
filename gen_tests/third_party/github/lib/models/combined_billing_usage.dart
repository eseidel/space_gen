import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CombinedBillingUsage {
  const CombinedBillingUsage({
    required this.daysLeftInBillingCycle,
    required this.estimatedPaidStorageForMonth,
    required this.estimatedStorageForMonth,
  });

  /// Converts a `Map<String, dynamic>` to a [CombinedBillingUsage].
  factory CombinedBillingUsage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CombinedBillingUsage',
      json,
      () => CombinedBillingUsage(
        daysLeftInBillingCycle: json['days_left_in_billing_cycle'] as int,
        estimatedPaidStorageForMonth:
            json['estimated_paid_storage_for_month'] as int,
        estimatedStorageForMonth: json['estimated_storage_for_month'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CombinedBillingUsage? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CombinedBillingUsage.fromJson(json);
  }

  /// Numbers of days left in billing cycle.
  final int daysLeftInBillingCycle;

  /// Estimated storage space (GB) used in billing cycle.
  final int estimatedPaidStorageForMonth;

  /// Estimated sum of free and paid storage space (GB) used in billing cycle.
  final int estimatedStorageForMonth;

  /// Converts a [CombinedBillingUsage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'days_left_in_billing_cycle': daysLeftInBillingCycle,
      'estimated_paid_storage_for_month': estimatedPaidStorageForMonth,
      'estimated_storage_for_month': estimatedStorageForMonth,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    daysLeftInBillingCycle,
    estimatedPaidStorageForMonth,
    estimatedStorageForMonth,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CombinedBillingUsage &&
        daysLeftInBillingCycle == other.daysLeftInBillingCycle &&
        estimatedPaidStorageForMonth == other.estimatedPaidStorageForMonth &&
        estimatedStorageForMonth == other.estimatedStorageForMonth;
  }
}
