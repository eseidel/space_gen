import 'package:discord/api_exception.dart';
import 'package:discord/messages/application_integration_type_configuration_response.dart';
import 'package:discord/messages/application_o_auth2_install_params_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationResponse {
  ApplicationResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.type,
    required this.verifyKey,
    required this.flags,
    this.coverImage,
    this.primarySkuId,
    this.bot,
    this.slug,
    this.guildId,
    this.rpcOrigins,
    this.botPublic,
    this.botRequireCodeGrant,
    this.termsOfServiceUrl,
    this.privacyPolicyUrl,
    this.customInstallUrl,
    this.installParams,
    this.integrationTypesConfig,
    this.maxParticipants,
    this.tags,
  }) {
    tags?.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to an [ApplicationResponse].
  factory ApplicationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationResponse',
      json,
      () => ApplicationResponse(
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
        slug: json['slug'] as String?,
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
        rpcOrigins: (json['rpc_origins'] as List?)?.cast<String>(),
        botPublic: json['bot_public'] as bool?,
        botRequireCodeGrant: json['bot_require_code_grant'] as bool?,
        termsOfServiceUrl: maybeParseUri(
          json['terms_of_service_url'] as String?,
        ),
        privacyPolicyUrl: maybeParseUri(json['privacy_policy_url'] as String?),
        customInstallUrl: maybeParseUri(json['custom_install_url'] as String?),
        installParams: ApplicationOAuth2InstallParamsResponse.maybeFromJson(
          json['install_params'] as Map<String, dynamic>?,
        ),
        integrationTypesConfig:
            (json['integration_types_config'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(
                key,
                ApplicationIntegrationTypeConfigurationResponse.fromJson(
                  value as Map<String, dynamic>,
                ),
              ),
            ),
        verifyKey: json['verify_key'] as String,
        flags: json['flags'] as int,
        maxParticipants: json['max_participants'] as int?,
        tags: (json['tags'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApplicationResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? icon;
  final String description;
  final ApplicationTypes? type;
  final String? coverImage;
  final SnowflakeType? primarySkuId;
  final UserResponse? bot;
  final String? slug;
  final SnowflakeType? guildId;
  final List<String>? rpcOrigins;
  final bool? botPublic;
  final bool? botRequireCodeGrant;
  final Uri? termsOfServiceUrl;
  final Uri? privacyPolicyUrl;
  final Uri? customInstallUrl;
  final ApplicationOAuth2InstallParamsResponse? installParams;
  final Map<String, ApplicationIntegrationTypeConfigurationResponse>?
  integrationTypesConfig;
  final String verifyKey;
  final int flags;
  final int? maxParticipants;
  final List<String>? tags;

  /// Converts an [ApplicationResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'icon': icon,
      'description': description,
      'type': type?.toJson(),
      'cover_image': ?coverImage,
      'primary_sku_id': ?primarySkuId?.toJson(),
      'bot': ?bot?.toJson(),
      'slug': ?slug,
      'guild_id': ?guildId?.toJson(),
      'rpc_origins': ?rpcOrigins,
      'bot_public': ?botPublic,
      'bot_require_code_grant': ?botRequireCodeGrant,
      'terms_of_service_url': ?termsOfServiceUrl?.toString(),
      'privacy_policy_url': ?privacyPolicyUrl?.toString(),
      'custom_install_url': ?customInstallUrl?.toString(),
      'install_params': ?installParams?.toJson(),
      'integration_types_config': ?integrationTypesConfig?.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'verify_key': verifyKey,
      'flags': flags,
      'max_participants': maxParticipants,
      'tags': ?tags,
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
    slug,
    guildId,
    listHash(rpcOrigins),
    botPublic,
    botRequireCodeGrant,
    termsOfServiceUrl,
    privacyPolicyUrl,
    customInstallUrl,
    installParams,
    mapHash(integrationTypesConfig),
    verifyKey,
    flags,
    maxParticipants,
    listHash(tags),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationResponse &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description &&
        type == other.type &&
        coverImage == other.coverImage &&
        primarySkuId == other.primarySkuId &&
        bot == other.bot &&
        slug == other.slug &&
        guildId == other.guildId &&
        listsEqual(rpcOrigins, other.rpcOrigins) &&
        botPublic == other.botPublic &&
        botRequireCodeGrant == other.botRequireCodeGrant &&
        termsOfServiceUrl == other.termsOfServiceUrl &&
        privacyPolicyUrl == other.privacyPolicyUrl &&
        customInstallUrl == other.customInstallUrl &&
        installParams == other.installParams &&
        mapsEqual(integrationTypesConfig, other.integrationTypesConfig) &&
        verifyKey == other.verifyKey &&
        flags == other.flags &&
        maxParticipants == other.maxParticipants &&
        listsEqual(tags, other.tags);
  }
}
