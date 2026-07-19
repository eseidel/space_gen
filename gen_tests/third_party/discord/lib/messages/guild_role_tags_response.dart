import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildRoleTagsResponse {
  const GuildRoleTagsResponse({
    this.premiumSubscriber,
    this.botId,
    this.integrationId,
    this.subscriptionListingId,
    this.availableForPurchase,
    this.guildConnections,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildRoleTagsResponse].
  factory GuildRoleTagsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildRoleTagsResponse',
      json,
      () => GuildRoleTagsResponse(
        premiumSubscriber: json['premium_subscriber'],
        botId: SnowflakeType.maybeFromJson(json['bot_id'] as String?),
        integrationId: SnowflakeType.maybeFromJson(
          json['integration_id'] as String?,
        ),
        subscriptionListingId: SnowflakeType.maybeFromJson(
          json['subscription_listing_id'] as String?,
        ),
        availableForPurchase: json['available_for_purchase'],
        guildConnections: json['guild_connections'],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildRoleTagsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildRoleTagsResponse.fromJson(json);
  }

  final dynamic premiumSubscriber;
  final SnowflakeType? botId;
  final SnowflakeType? integrationId;
  final SnowflakeType? subscriptionListingId;
  final dynamic availableForPurchase;
  final dynamic guildConnections;

  /// Converts a [GuildRoleTagsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (premiumSubscriber != null) 'premium_subscriber': premiumSubscriber,
      if (botId != null) 'bot_id': botId?.toJson(),
      if (integrationId != null) 'integration_id': integrationId?.toJson(),
      if (subscriptionListingId != null)
        'subscription_listing_id': subscriptionListingId?.toJson(),
      if (availableForPurchase != null)
        'available_for_purchase': availableForPurchase,
      if (guildConnections != null) 'guild_connections': guildConnections,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    premiumSubscriber,
    botId,
    integrationId,
    subscriptionListingId,
    availableForPurchase,
    guildConnections,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildRoleTagsResponse &&
        premiumSubscriber == other.premiumSubscriber &&
        botId == other.botId &&
        integrationId == other.integrationId &&
        subscriptionListingId == other.subscriptionListingId &&
        availableForPurchase == other.availableForPurchase &&
        guildConnections == other.guildConnections;
  }
}
