import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UserAvatarDecorationResponse {
  const UserAvatarDecorationResponse({
    required this.asset,
    required this.skuId,
  });

  /// Converts a `Map<String, dynamic>` to a [UserAvatarDecorationResponse].
  factory UserAvatarDecorationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserAvatarDecorationResponse',
      json,
      () => UserAvatarDecorationResponse(
        asset: json['asset'] as String,
        skuId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'sku_id') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserAvatarDecorationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserAvatarDecorationResponse.fromJson(json);
  }

  final String asset;
  final SnowflakeType? skuId;

  /// Converts a [UserAvatarDecorationResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'asset': asset, 'sku_id': skuId?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([asset, skuId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserAvatarDecorationResponse &&
        asset == other.asset &&
        skuId == other.skuId;
  }
}
