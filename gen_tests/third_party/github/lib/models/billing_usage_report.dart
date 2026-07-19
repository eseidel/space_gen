import 'package:github/model_helpers.dart';
import 'package:github/models/billing_usage_report_usage_items_inner.dart';
import 'package:meta/meta.dart';

@immutable
class BillingUsageReport {
  const BillingUsageReport({this.usageItems});

  /// Converts a `Map<String, dynamic>` to a [BillingUsageReport].
  factory BillingUsageReport.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BillingUsageReport',
      json,
      () => BillingUsageReport(
        usageItems: (json['usageItems'] as List?)
            ?.map<BillingUsageReportUsageItemsInner>(
              (e) => BillingUsageReportUsageItemsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BillingUsageReport? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BillingUsageReport.fromJson(json);
  }

  final List<BillingUsageReportUsageItemsInner>? usageItems;

  /// Converts a [BillingUsageReport] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'usageItems': ?usageItems?.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(usageItems).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BillingUsageReport &&
        listsEqual(usageItems, other.usageItems);
  }
}
