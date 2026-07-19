import 'package:github/model_helpers.dart';
import 'package:github/models/billing_usage_report_user_usage_items_inner.dart';
import 'package:meta/meta.dart';

@immutable
class BillingUsageReportUser {
  const BillingUsageReportUser({this.usageItems});

  /// Converts a `Map<String, dynamic>` to a [BillingUsageReportUser].
  factory BillingUsageReportUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BillingUsageReportUser',
      json,
      () => BillingUsageReportUser(
        usageItems: (json['usageItems'] as List?)
            ?.map<BillingUsageReportUserUsageItemsInner>(
              (e) => BillingUsageReportUserUsageItemsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BillingUsageReportUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BillingUsageReportUser.fromJson(json);
  }

  final List<BillingUsageReportUserUsageItemsInner>? usageItems;

  /// Converts a [BillingUsageReportUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'usageItems': ?usageItems?.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(usageItems).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BillingUsageReportUser &&
        listsEqual(usageItems, other.usageItems);
  }
}
