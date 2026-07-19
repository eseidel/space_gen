import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildProductPurchaseResponse {
  const GuildProductPurchaseResponse({
    required this.listingId,
    required this.productName,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildProductPurchaseResponse].
  factory GuildProductPurchaseResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildProductPurchaseResponse',
      json,
      () => GuildProductPurchaseResponse(
        listingId: SnowflakeType.fromJson(json['listing_id'] as String),
        productName: json['product_name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildProductPurchaseResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildProductPurchaseResponse.fromJson(json);
  }

  final SnowflakeType listingId;
  final String productName;

  /// Converts a [GuildProductPurchaseResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'listing_id': listingId.toJson(), 'product_name': productName};
  }

  @override
  int get hashCode => Object.hashAll([listingId, productName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildProductPurchaseResponse &&
        listingId == other.listingId &&
        productName == other.productName;
  }
}
