import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/action_types.dart';
import 'package:discord/models/application_event_webhooks_status.dart';
import 'package:discord/models/application_explicit_content_filter_types.dart';
import 'package:discord/models/application_form_partial_description.dart';
import 'package:discord/models/application_integration_type_configuration.dart';
import 'package:discord/models/application_o_auth2_install_params.dart';
import 'package:discord/models/application_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationFormPartial {
  ApplicationFormPartial({
    this.description,
    this.icon,
    this.coverImage,
    this.teamId,
    this.flags,
    this.interactionsEndpointUrl,
    this.explicitContentFilter,
    this.maxParticipants,
    this.type,
    this.tags,
    this.customInstallUrl,
    this.installParams,
    this.roleConnectionsVerificationUrl,
    this.integrationTypesConfig,
    this.eventWebhooksStatus,
    this.eventWebhooksUrl,
    this.eventWebhooksTypes,
  }) {
    maxParticipants?.validate(min: -1);
    tags?.validate(maxItems: 5, unique: true);
    integrationTypesConfig?.validate(minProperties: 1, maxProperties: 2);
    eventWebhooksTypes?.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to an [ApplicationFormPartial].
  factory ApplicationFormPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationFormPartial',
      json,
      () => ApplicationFormPartial(
        description: ApplicationFormPartialDescription.maybeFromJson(
          json['description'] as Map<String, dynamic>?,
        ),
        icon: maybeBase64Decode(json['icon'] as String?),
        coverImage: maybeBase64Decode(json['cover_image'] as String?),
        teamId: SnowflakeType.maybeFromJson(json['team_id'] as String?),
        flags: json['flags'] as int?,
        interactionsEndpointUrl: maybeParseUri(
          json['interactions_endpoint_url'] as String?,
        ),
        explicitContentFilter:
            ApplicationExplicitContentFilterTypes.maybeFromJson(
              json['explicit_content_filter'] as int?,
            ),
        maxParticipants: json['max_participants'] as int?,
        type: ApplicationTypes.maybeFromJson(json['type'] as int?),
        tags: (json['tags'] as List?)?.cast<String>(),
        customInstallUrl: maybeParseUri(json['custom_install_url'] as String?),
        installParams: ApplicationOAuth2InstallParams.maybeFromJson(
          json['install_params'] as Map<String, dynamic>?,
        ),
        roleConnectionsVerificationUrl: maybeParseUri(
          json['role_connections_verification_url'] as String?,
        ),
        integrationTypesConfig:
            (json['integration_types_config'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(
                key,
                ApplicationIntegrationTypeConfiguration.fromJson(
                  value as Map<String, dynamic>,
                ),
              ),
            ),
        eventWebhooksStatus: ApplicationEventWebhooksStatus.maybeFromJson(
          json['event_webhooks_status'] as int?,
        ),
        eventWebhooksUrl: maybeParseUri(json['event_webhooks_url'] as String?),
        eventWebhooksTypes: (json['event_webhooks_types'] as List?)
            ?.map<ActionTypes>((e) => ActionTypes.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationFormPartial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApplicationFormPartial.fromJson(json);
  }

  final ApplicationFormPartialDescription? description;
  final Uint8List? icon;
  final Uint8List? coverImage;
  final SnowflakeType? teamId;
  final int? flags;
  final Uri? interactionsEndpointUrl;
  final ApplicationExplicitContentFilterTypes? explicitContentFilter;
  final int? maxParticipants;
  final ApplicationTypes? type;
  final List<String>? tags;
  final Uri? customInstallUrl;
  final ApplicationOAuth2InstallParams? installParams;
  final Uri? roleConnectionsVerificationUrl;
  final Map<String, ApplicationIntegrationTypeConfiguration>?
  integrationTypesConfig;
  final ApplicationEventWebhooksStatus? eventWebhooksStatus;
  final Uri? eventWebhooksUrl;
  final List<ActionTypes>? eventWebhooksTypes;

  /// Converts an [ApplicationFormPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
      'icon': maybeBase64Encode(icon),
      'cover_image': maybeBase64Encode(coverImage),
      'team_id': teamId?.toJson(),
      'flags': flags,
      'interactions_endpoint_url': interactionsEndpointUrl?.toString(),
      'explicit_content_filter': explicitContentFilter?.toJson(),
      'max_participants': maxParticipants,
      'type': type?.toJson(),
      'tags': tags,
      'custom_install_url': customInstallUrl?.toString(),
      'install_params': installParams?.toJson(),
      'role_connections_verification_url': roleConnectionsVerificationUrl
          ?.toString(),
      'integration_types_config': integrationTypesConfig?.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'event_webhooks_status': eventWebhooksStatus?.toJson(),
      'event_webhooks_url': eventWebhooksUrl?.toString(),
      'event_webhooks_types': eventWebhooksTypes
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    description,
    listHash(icon),
    listHash(coverImage),
    teamId,
    flags,
    interactionsEndpointUrl,
    explicitContentFilter,
    maxParticipants,
    type,
    listHash(tags),
    customInstallUrl,
    installParams,
    roleConnectionsVerificationUrl,
    mapHash(integrationTypesConfig),
    eventWebhooksStatus,
    eventWebhooksUrl,
    listHash(eventWebhooksTypes),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationFormPartial &&
        description == other.description &&
        listsEqual(icon, other.icon) &&
        listsEqual(coverImage, other.coverImage) &&
        teamId == other.teamId &&
        flags == other.flags &&
        interactionsEndpointUrl == other.interactionsEndpointUrl &&
        explicitContentFilter == other.explicitContentFilter &&
        maxParticipants == other.maxParticipants &&
        type == other.type &&
        listsEqual(tags, other.tags) &&
        customInstallUrl == other.customInstallUrl &&
        installParams == other.installParams &&
        roleConnectionsVerificationUrl ==
            other.roleConnectionsVerificationUrl &&
        mapsEqual(integrationTypesConfig, other.integrationTypesConfig) &&
        eventWebhooksStatus == other.eventWebhooksStatus &&
        eventWebhooksUrl == other.eventWebhooksUrl &&
        listsEqual(eventWebhooksTypes, other.eventWebhooksTypes);
  }
}
