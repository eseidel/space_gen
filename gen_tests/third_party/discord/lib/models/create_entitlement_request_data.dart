import 'package:discord/model_helpers.dart';
import 'package:discord/models/entitlement_owner_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class CreateEntitlementRequestData {
  const CreateEntitlementRequestData({
    required this.skuId,
    required this.ownerId,
    required this.ownerType,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateEntitlementRequestData].
  factory CreateEntitlementRequestData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateEntitlementRequestData',
      json,
      () => CreateEntitlementRequestData(
        skuId: SnowflakeType.fromJson(json['sku_id'] as String),
        ownerId: SnowflakeType.fromJson(json['owner_id'] as String),
        ownerType: EntitlementOwnerTypes.fromJson(
          json['owner_type'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateEntitlementRequestData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateEntitlementRequestData.fromJson(json);
  }

  final SnowflakeType skuId;
  final SnowflakeType ownerId;
  final EntitlementOwnerTypes ownerType;

  /// Converts a [CreateEntitlementRequestData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sku_id': skuId.toJson(),
      'owner_id': ownerId.toJson(),
      'owner_type': ownerType.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([skuId, ownerId, ownerType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateEntitlementRequestData &&
        skuId == other.skuId &&
        ownerId == other.ownerId &&
        ownerType == other.ownerType;
  }
}
