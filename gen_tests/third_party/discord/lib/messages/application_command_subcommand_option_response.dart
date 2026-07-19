// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:discord/models/application_command_subcommand_option_response_options_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandSubcommandOptionResponse {
  const ApplicationCommandSubcommandOptionResponse({
    required this.name,
    required this.description,
    this.nameLocalized,
    this.nameLocalizations,
    this.descriptionLocalized,
    this.descriptionLocalizations,
    this.required_,
    this.options,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandSubcommandOptionResponse].
  factory ApplicationCommandSubcommandOptionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandSubcommandOptionResponse',
      json,
      () => ApplicationCommandSubcommandOptionResponse(
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
        required_: json['required'] as bool?,
        options: (json['options'] as List?)
            ?.map<ApplicationCommandSubcommandOptionResponseOptionsInner>(
              (e) =>
                  ApplicationCommandSubcommandOptionResponseOptionsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandSubcommandOptionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandSubcommandOptionResponse.fromJson(json);
  }

  ApplicationCommandOptionType get type =>
      ApplicationCommandOptionType.subCommand;
  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final String description;
  final String? descriptionLocalized;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final List<ApplicationCommandSubcommandOptionResponseOptionsInner>? options;

  /// Converts an [ApplicationCommandSubcommandOptionResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'name_localized': nameLocalized,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localized': descriptionLocalized,
      'description_localizations': descriptionLocalizations,
      'required': required_,
      'options': options?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    nameLocalized,
    mapHash(nameLocalizations),
    description,
    descriptionLocalized,
    mapHash(descriptionLocalizations),
    required_,
    listHash(options),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandSubcommandOptionResponse &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        descriptionLocalized == other.descriptionLocalized &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_ &&
        listsEqual(options, other.options);
  }
}
