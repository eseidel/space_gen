import 'package:discord/model_helpers.dart';
import 'package:discord/models/nameplate_palette.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UserNameplateResponse {
  const UserNameplateResponse({
    required this.skuId,
    required this.asset,
    required this.label,
    required this.palette,
  });

  /// Converts a `Map<String, dynamic>` to a [UserNameplateResponse].
  factory UserNameplateResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserNameplateResponse',
      json,
      () => UserNameplateResponse(
        skuId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'sku_id') as String?,
        ),
        asset: json['asset'] as String,
        label: json['label'] as String,
        palette: NameplatePalette.fromJson(
          json['palette'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserNameplateResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserNameplateResponse.fromJson(json);
  }

  final SnowflakeType? skuId;
  final String asset;
  final String label;
  final NameplatePalette palette;

  /// Converts a [UserNameplateResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sku_id': skuId?.toJson(),
      'asset': asset,
      'label': label,
      'palette': palette.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([skuId, asset, label, palette]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserNameplateResponse &&
        skuId == other.skuId &&
        asset == other.asset &&
        label == other.label &&
        palette == other.palette;
  }
}
