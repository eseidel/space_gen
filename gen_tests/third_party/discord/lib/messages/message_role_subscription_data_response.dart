import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageRoleSubscriptionDataResponse {
  const MessageRoleSubscriptionDataResponse({
    required this.roleSubscriptionListingId,
    required this.tierName,
    required this.totalMonthsSubscribed,
    required this.isRenewal,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MessageRoleSubscriptionDataResponse].
  factory MessageRoleSubscriptionDataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MessageRoleSubscriptionDataResponse',
      json,
      () => MessageRoleSubscriptionDataResponse(
        roleSubscriptionListingId: SnowflakeType.fromJson(
          json['role_subscription_listing_id'] as String,
        ),
        tierName: json['tier_name'] as String,
        totalMonthsSubscribed: json['total_months_subscribed'] as int,
        isRenewal: json['is_renewal'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageRoleSubscriptionDataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageRoleSubscriptionDataResponse.fromJson(json);
  }

  final SnowflakeType roleSubscriptionListingId;
  final String tierName;
  final int totalMonthsSubscribed;
  final bool isRenewal;

  /// Converts a [MessageRoleSubscriptionDataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'role_subscription_listing_id': roleSubscriptionListingId.toJson(),
      'tier_name': tierName,
      'total_months_subscribed': totalMonthsSubscribed,
      'is_renewal': isRenewal,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    roleSubscriptionListingId,
    tierName,
    totalMonthsSubscribed,
    isRenewal,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageRoleSubscriptionDataResponse &&
        roleSubscriptionListingId == other.roleSubscriptionListingId &&
        tierName == other.tierName &&
        totalMonthsSubscribed == other.totalMonthsSubscribed &&
        isRenewal == other.isRenewal;
  }
}
