import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_response_options_inner.dart';
import 'package:discord/models/application_command_type.dart';
import 'package:discord/models/application_integration_type.dart';
import 'package:discord/models/interaction_context_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandResponse {
  ApplicationCommandResponse({
    required this.id,
    required this.applicationId,
    required this.version,
    required this.defaultMemberPermissions,
    required this.type,
    required this.name,
    required this.description,
    this.nameLocalized,
    this.nameLocalizations,
    this.descriptionLocalized,
    this.descriptionLocalizations,
    this.guildId,
    this.dmPermission,
    this.contexts,
    this.integrationTypes,
    this.options,
    this.nsfw,
  }) {
    contexts?.validate(unique: true);
    integrationTypes?.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to an [ApplicationCommandResponse].
  factory ApplicationCommandResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationCommandResponse',
      json,
      () => ApplicationCommandResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        applicationId: SnowflakeType.fromJson(json['application_id'] as String),
        version: SnowflakeType.fromJson(json['version'] as String),
        defaultMemberPermissions:
            checkedKey(json, 'default_member_permissions') as String?,
        type: ApplicationCommandType.fromJson(json['type'] as int),
        name: json['name'] as String,
        nameLocalized: json['name_localized'] as String?,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String,
        descriptionLocalized: json['description_localized'] as String?,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
        dmPermission: json['dm_permission'] as bool?,
        contexts: (json['contexts'] as List?)
            ?.map<InteractionContextType>(
              (e) => InteractionContextType.fromJson(e as int),
            )
            .toList(),
        integrationTypes: (json['integration_types'] as List?)
            ?.map<ApplicationIntegrationType>(
              (e) => ApplicationIntegrationType.fromJson(e as int),
            )
            .toList(),
        options: (json['options'] as List?)
            ?.map<ApplicationCommandResponseOptionsInner>(
              (e) => ApplicationCommandResponseOptionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        nsfw: json['nsfw'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType applicationId;
  final SnowflakeType version;
  final String? defaultMemberPermissions;
  final ApplicationCommandType type;
  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final String description;
  final String? descriptionLocalized;
  final Map<String, String>? descriptionLocalizations;
  final SnowflakeType? guildId;
  final bool? dmPermission;
  final List<InteractionContextType>? contexts;
  final List<ApplicationIntegrationType>? integrationTypes;
  final List<ApplicationCommandResponseOptionsInner>? options;
  final bool? nsfw;

  /// Converts an [ApplicationCommandResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'application_id': applicationId.toJson(),
      'version': version.toJson(),
      'default_member_permissions': defaultMemberPermissions,
      'type': type.toJson(),
      'name': name,
      'name_localized': ?nameLocalized,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localized': ?descriptionLocalized,
      'description_localizations': descriptionLocalizations,
      'guild_id': ?guildId?.toJson(),
      'dm_permission': ?dmPermission,
      'contexts': contexts?.map((e) => e.toJson()).toList(),
      'integration_types': ?integrationTypes?.map((e) => e.toJson()).toList(),
      'options': ?options?.map((e) => e.toJson()).toList(),
      'nsfw': ?nsfw,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    applicationId,
    version,
    defaultMemberPermissions,
    type,
    name,
    nameLocalized,
    mapHash(nameLocalizations),
    description,
    descriptionLocalized,
    mapHash(descriptionLocalizations),
    guildId,
    dmPermission,
    listHash(contexts),
    listHash(integrationTypes),
    listHash(options),
    nsfw,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandResponse &&
        id == other.id &&
        applicationId == other.applicationId &&
        version == other.version &&
        defaultMemberPermissions == other.defaultMemberPermissions &&
        type == other.type &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        descriptionLocalized == other.descriptionLocalized &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        guildId == other.guildId &&
        dmPermission == other.dmPermission &&
        listsEqual(contexts, other.contexts) &&
        listsEqual(integrationTypes, other.integrationTypes) &&
        listsEqual(options, other.options) &&
        nsfw == other.nsfw;
  }
}
