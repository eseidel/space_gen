import 'package:github/model_helpers.dart';
import 'package:github/models/marketplace_purchase_marketplace_pending_change.dart';
import 'package:github/models/marketplace_purchase_marketplace_purchase.dart';
import 'package:meta/meta.dart';

/// {@template marketplace_purchase}
/// Marketplace Purchase
/// Marketplace Purchase
/// {@endtemplate}
@immutable
class MarketplacePurchase {
  /// {@macro marketplace_purchase}
  const MarketplacePurchase({
    required this.url,
    required this.type,
    required this.id,
    required this.login,
    required this.marketplacePurchase,
    this.organizationBillingEmail,
    this.email,
    this.marketplacePendingChange,
  });

  /// Converts a `Map<String, dynamic>` to a [MarketplacePurchase].
  factory MarketplacePurchase.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MarketplacePurchase',
      json,
      () => MarketplacePurchase(
        url: json['url'] as String,
        type: json['type'] as String,
        id: json['id'] as int,
        login: json['login'] as String,
        organizationBillingEmail: json['organization_billing_email'] as String?,
        email: json['email'] as String?,
        marketplacePendingChange:
            MarketplacePurchaseMarketplacePendingChange.maybeFromJson(
              json['marketplace_pending_change'] as Map<String, dynamic>?,
            ),
        marketplacePurchase: MarketplacePurchaseMarketplacePurchase.fromJson(
          json['marketplace_purchase'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketplacePurchase? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MarketplacePurchase.fromJson(json);
  }

  final String url;
  final String type;
  final int id;
  final String login;
  final String? organizationBillingEmail;
  final String? email;
  final MarketplacePurchaseMarketplacePendingChange? marketplacePendingChange;
  final MarketplacePurchaseMarketplacePurchase marketplacePurchase;

  /// Converts a [MarketplacePurchase] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'type': type,
      'id': id,
      'login': login,
      'organization_billing_email': ?organizationBillingEmail,
      'email': email,
      'marketplace_pending_change': marketplacePendingChange?.toJson(),
      'marketplace_purchase': marketplacePurchase.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    type,
    id,
    login,
    organizationBillingEmail,
    email,
    marketplacePendingChange,
    marketplacePurchase,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarketplacePurchase &&
        url == other.url &&
        type == other.type &&
        id == other.id &&
        login == other.login &&
        organizationBillingEmail == other.organizationBillingEmail &&
        email == other.email &&
        marketplacePendingChange == other.marketplacePendingChange &&
        marketplacePurchase == other.marketplacePurchase;
  }
}
