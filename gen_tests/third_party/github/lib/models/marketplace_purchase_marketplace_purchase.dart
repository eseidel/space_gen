import 'package:github/model_helpers.dart';
import 'package:github/models/marketplace_listing_plan.dart';
import 'package:meta/meta.dart';

@immutable
class MarketplacePurchaseMarketplacePurchase {
  const MarketplacePurchaseMarketplacePurchase({
    this.billingCycle,
    this.nextBillingDate,
    this.isInstalled,
    this.unitCount,
    this.onFreeTrial,
    this.freeTrialEndsOn,
    this.updatedAt,
    this.plan,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MarketplacePurchaseMarketplacePurchase].
  factory MarketplacePurchaseMarketplacePurchase.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MarketplacePurchaseMarketplacePurchase',
      json,
      () => MarketplacePurchaseMarketplacePurchase(
        billingCycle: json['billing_cycle'] as String?,
        nextBillingDate: json['next_billing_date'] as String?,
        isInstalled: json['is_installed'] as bool?,
        unitCount: json['unit_count'] as int?,
        onFreeTrial: json['on_free_trial'] as bool?,
        freeTrialEndsOn: json['free_trial_ends_on'] as String?,
        updatedAt: json['updated_at'] as String?,
        plan: MarketplaceListingPlan.maybeFromJson(
          json['plan'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketplacePurchaseMarketplacePurchase? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MarketplacePurchaseMarketplacePurchase.fromJson(json);
  }

  final String? billingCycle;
  final String? nextBillingDate;
  final bool? isInstalled;
  final int? unitCount;
  final bool? onFreeTrial;
  final String? freeTrialEndsOn;
  final String? updatedAt;

  /// Marketplace Listing Plan
  /// Marketplace Listing Plan
  final MarketplaceListingPlan? plan;

  /// Converts a [MarketplacePurchaseMarketplacePurchase]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (billingCycle != null) 'billing_cycle': billingCycle,
      'next_billing_date': nextBillingDate,
      if (isInstalled != null) 'is_installed': isInstalled,
      'unit_count': unitCount,
      if (onFreeTrial != null) 'on_free_trial': onFreeTrial,
      'free_trial_ends_on': freeTrialEndsOn,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (plan != null) 'plan': plan?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    billingCycle,
    nextBillingDate,
    isInstalled,
    unitCount,
    onFreeTrial,
    freeTrialEndsOn,
    updatedAt,
    plan,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarketplacePurchaseMarketplacePurchase &&
        billingCycle == other.billingCycle &&
        nextBillingDate == other.nextBillingDate &&
        isInstalled == other.isInstalled &&
        unitCount == other.unitCount &&
        onFreeTrial == other.onFreeTrial &&
        freeTrialEndsOn == other.freeTrialEndsOn &&
        updatedAt == other.updatedAt &&
        plan == other.plan;
  }
}
