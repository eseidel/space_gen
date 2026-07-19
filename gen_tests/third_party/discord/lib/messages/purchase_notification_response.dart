import 'package:discord/messages/guild_product_purchase_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/purchase_type.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseNotificationResponse {
  const PurchaseNotificationResponse({
    required this.type,
    this.guildProductPurchase,
  });

  /// Converts a `Map<String, dynamic>` to a [PurchaseNotificationResponse].
  factory PurchaseNotificationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PurchaseNotificationResponse',
      json,
      () => PurchaseNotificationResponse(
        type: PurchaseType.fromJson(json['type'] as int),
        guildProductPurchase: GuildProductPurchaseResponse.maybeFromJson(
          json['guild_product_purchase'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseNotificationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PurchaseNotificationResponse.fromJson(json);
  }

  final PurchaseType type;
  final GuildProductPurchaseResponse? guildProductPurchase;

  /// Converts a [PurchaseNotificationResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'guild_product_purchase': ?guildProductPurchase?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([type, guildProductPurchase]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PurchaseNotificationResponse &&
        type == other.type &&
        guildProductPurchase == other.guildProductPurchase;
  }
}
