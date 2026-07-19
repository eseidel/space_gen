import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class IntegrationApplicationResponse {
  const IntegrationApplicationResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.type,
    this.coverImage,
    this.primarySkuId,
    this.bot,
  });

  /// Converts a `Map<String, dynamic>` to an [IntegrationApplicationResponse].
  factory IntegrationApplicationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IntegrationApplicationResponse',
      json,
      () => IntegrationApplicationResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        icon: checkedKey(json, 'icon') as String?,
        description: json['description'] as String,
        type: ApplicationTypes.maybeFromJson(checkedKey(json, 'type') as int?),
        coverImage: json['cover_image'] as String?,
        primarySkuId: SnowflakeType.maybeFromJson(
          json['primary_sku_id'] as String?,
        ),
        bot: UserResponse.maybeFromJson(json['bot'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IntegrationApplicationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IntegrationApplicationResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? icon;
  final String description;
  final ApplicationTypes? type;
  final String? coverImage;
  final SnowflakeType? primarySkuId;
  final UserResponse? bot;

  /// Converts an [IntegrationApplicationResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'icon': icon,
      'description': description,
      'type': type?.toJson(),
      if (coverImage != null) 'cover_image': coverImage,
      if (primarySkuId != null) 'primary_sku_id': primarySkuId?.toJson(),
      if (bot != null) 'bot': bot?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    icon,
    description,
    type,
    coverImage,
    primarySkuId,
    bot,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IntegrationApplicationResponse &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description &&
        type == other.type &&
        coverImage == other.coverImage &&
        primarySkuId == other.primarySkuId &&
        bot == other.bot;
  }
}
