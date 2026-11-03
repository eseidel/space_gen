// A spec constraint bound exceeds JS's safe-integer range, so the
// generated `validate` call carries an integer literal dart2js
// rounds. The bound is faithful to the spec; precise web handling of
// 64-bit integers is tracked in
// https://github.com/eseidel/space_gen/issues/185.
// ignore_for_file: avoid_js_rounded_ints
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_create_request_options_inner.dart';
import 'package:discord/models/application_command_handler.dart';
import 'package:discord/models/application_command_type.dart';
import 'package:discord/models/application_integration_type.dart';
import 'package:discord/models/interaction_context_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandCreateRequest {
  ApplicationCommandCreateRequest({
    required this.name,
    this.nameLocalizations,
    this.description,
    this.descriptionLocalizations,
    this.options,
    this.defaultMemberPermissions,
    this.dmPermission,
    this.contexts,
    this.integrationTypes,
    this.handler,
    this.type,
  }) {
    name.validate(minLength: 1, maxLength: 32);
    nameLocalizations?.validate(maxProperties: 34);
    description?.validate(maxLength: 100);
    descriptionLocalizations?.validate(maxProperties: 34);
    options?.validate(maxItems: 25);
    defaultMemberPermissions?.validate(min: 0, max: 18014398509481983);
    contexts?.validate(minItems: 1, unique: true);
    integrationTypes?.validate(minItems: 1, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to an [ApplicationCommandCreateRequest].
  factory ApplicationCommandCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationCommandCreateRequest',
      json,
      () => ApplicationCommandCreateRequest(
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String?,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        options: (json['options'] as List?)
            ?.map<ApplicationCommandCreateRequestOptionsInner>(
              (e) => ApplicationCommandCreateRequestOptionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        defaultMemberPermissions: json['default_member_permissions'] as int?,
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
        handler: ApplicationCommandHandler.maybeFromJson(
          json['handler'] as Map<String, dynamic>?,
        ),
        type: ApplicationCommandType.maybeFromJson(json['type'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandCreateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandCreateRequest.fromJson(json);
  }

  final String name;
  final Map<String, String>? nameLocalizations;
  final String? description;
  final Map<String, String>? descriptionLocalizations;
  final List<ApplicationCommandCreateRequestOptionsInner>? options;
  final int? defaultMemberPermissions;
  final bool? dmPermission;
  final List<InteractionContextType>? contexts;
  final List<ApplicationIntegrationType>? integrationTypes;
  final ApplicationCommandHandler? handler;
  final ApplicationCommandType? type;

  /// Converts an [ApplicationCommandCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localizations': descriptionLocalizations,
      'options': options?.map((e) => e.toJson()).toList(),
      'default_member_permissions': defaultMemberPermissions,
      'dm_permission': dmPermission,
      'contexts': contexts?.map((e) => e.toJson()).toList(),
      'integration_types': integrationTypes?.map((e) => e.toJson()).toList(),
      'handler': handler?.toJson(),
      'type': type?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    mapHash(nameLocalizations),
    description,
    mapHash(descriptionLocalizations),
    listHash(options),
    defaultMemberPermissions,
    dmPermission,
    listHash(contexts),
    listHash(integrationTypes),
    handler,
    type,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandCreateRequest &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        listsEqual(options, other.options) &&
        defaultMemberPermissions == other.defaultMemberPermissions &&
        dmPermission == other.dmPermission &&
        listsEqual(contexts, other.contexts) &&
        listsEqual(integrationTypes, other.integrationTypes) &&
        handler == other.handler &&
        type == other.type;
  }
}
