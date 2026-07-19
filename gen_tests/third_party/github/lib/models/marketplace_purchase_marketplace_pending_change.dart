import 'package:github/model_helpers.dart';
import 'package:github/models/marketplace_listing_plan.dart';
import 'package:meta/meta.dart';

@immutable
class MarketplacePurchaseMarketplacePendingChange {
  const MarketplacePurchaseMarketplacePendingChange({
    this.isInstalled,
    this.effectiveDate,
    this.unitCount,
    this.id,
    this.plan,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MarketplacePurchaseMarketplacePendingChange].
  factory MarketplacePurchaseMarketplacePendingChange.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MarketplacePurchaseMarketplacePendingChange',
      json,
      () => MarketplacePurchaseMarketplacePendingChange(
        isInstalled: json['is_installed'] as bool?,
        effectiveDate: json['effective_date'] as String?,
        unitCount: json['unit_count'] as int?,
        id: json['id'] as int?,
        plan: MarketplaceListingPlan.maybeFromJson(
          json['plan'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketplacePurchaseMarketplacePendingChange? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MarketplacePurchaseMarketplacePendingChange.fromJson(json);
  }

  final bool? isInstalled;
  final String? effectiveDate;
  final int? unitCount;
  final int? id;

  /// Marketplace Listing Plan
  /// Marketplace Listing Plan
  final MarketplaceListingPlan? plan;

  /// Converts a [MarketplacePurchaseMarketplacePendingChange]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (isInstalled != null) 'is_installed': isInstalled,
      if (effectiveDate != null) 'effective_date': effectiveDate,
      'unit_count': unitCount,
      if (id != null) 'id': id,
      if (plan != null) 'plan': plan?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([isInstalled, effectiveDate, unitCount, id, plan]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarketplacePurchaseMarketplacePendingChange &&
        isInstalled == other.isInstalled &&
        effectiveDate == other.effectiveDate &&
        unitCount == other.unitCount &&
        id == other.id &&
        plan == other.plan;
  }
}
