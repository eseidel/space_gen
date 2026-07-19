import 'package:discord/messages/entitlement_tenant_fulfillment_status_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/entitlement_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class EntitlementResponse {
  const EntitlementResponse({
    required this.id,
    required this.skuId,
    required this.applicationId,
    required this.userId,
    required this.deleted,
    required this.startsAt,
    required this.endsAt,
    required this.type,
    this.guildId,
    this.fulfilledAt,
    this.fulfillmentStatus,
    this.consumed,
    this.gifterUserId,
    this.parentId,
  });

  /// Converts a `Map<String, dynamic>` to an [EntitlementResponse].
  factory EntitlementResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntitlementResponse',
      json,
      () => EntitlementResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        skuId: SnowflakeType.fromJson(json['sku_id'] as String),
        applicationId: SnowflakeType.fromJson(json['application_id'] as String),
        userId: SnowflakeType.fromJson(json['user_id'] as String),
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
        deleted: json['deleted'] as bool,
        startsAt: maybeParseDateTime(checkedKey(json, 'starts_at') as String?),
        endsAt: maybeParseDateTime(checkedKey(json, 'ends_at') as String?),
        type: EntitlementTypes.fromJson(json['type'] as int),
        fulfilledAt: maybeParseDateTime(json['fulfilled_at'] as String?),
        fulfillmentStatus:
            EntitlementTenantFulfillmentStatusResponse.maybeFromJson(
              json['fulfillment_status'] as int?,
            ),
        consumed: json['consumed'] as bool?,
        gifterUserId: SnowflakeType.maybeFromJson(
          json['gifter_user_id'] as String?,
        ),
        parentId: SnowflakeType.maybeFromJson(json['parent_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntitlementResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntitlementResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType skuId;
  final SnowflakeType applicationId;
  final SnowflakeType userId;
  final SnowflakeType? guildId;
  final bool deleted;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final EntitlementTypes type;
  final DateTime? fulfilledAt;
  final EntitlementTenantFulfillmentStatusResponse? fulfillmentStatus;
  final bool? consumed;
  final SnowflakeType? gifterUserId;
  final SnowflakeType? parentId;

  /// Converts an [EntitlementResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'sku_id': skuId.toJson(),
      'application_id': applicationId.toJson(),
      'user_id': userId.toJson(),
      'guild_id': guildId?.toJson(),
      'deleted': deleted,
      'starts_at': startsAt?.toIso8601String(),
      'ends_at': endsAt?.toIso8601String(),
      'type': type.toJson(),
      'fulfilled_at': fulfilledAt?.toIso8601String(),
      'fulfillment_status': fulfillmentStatus?.toJson(),
      if (consumed != null) 'consumed': consumed,
      'gifter_user_id': gifterUserId?.toJson(),
      'parent_id': parentId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    skuId,
    applicationId,
    userId,
    guildId,
    deleted,
    startsAt,
    endsAt,
    type,
    fulfilledAt,
    fulfillmentStatus,
    consumed,
    gifterUserId,
    parentId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntitlementResponse &&
        id == other.id &&
        skuId == other.skuId &&
        applicationId == other.applicationId &&
        userId == other.userId &&
        guildId == other.guildId &&
        deleted == other.deleted &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        type == other.type &&
        fulfilledAt == other.fulfilledAt &&
        fulfillmentStatus == other.fulfillmentStatus &&
        consumed == other.consumed &&
        gifterUserId == other.gifterUserId &&
        parentId == other.parentId;
  }
}
