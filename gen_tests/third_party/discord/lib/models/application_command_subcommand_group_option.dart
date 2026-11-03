import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:discord/models/application_command_subcommand_option.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandSubcommandGroupOption {
  ApplicationCommandSubcommandGroupOption({
    required this.name,
    required this.description,
    this.nameLocalizations,
    this.descriptionLocalizations,
    this.required_,
    this.options,
  }) {
    name.validate(minLength: 1, maxLength: 32);
    nameLocalizations?.validate(maxProperties: 34);
    description.validate(minLength: 1, maxLength: 100);
    descriptionLocalizations?.validate(maxProperties: 34);
    options?.validate(maxItems: 25);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandSubcommandGroupOption].
  factory ApplicationCommandSubcommandGroupOption.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandSubcommandGroupOption',
      json,
      () => ApplicationCommandSubcommandGroupOption(
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        required_: json['required'] as bool?,
        options: (json['options'] as List?)
            ?.map<ApplicationCommandSubcommandOption>(
              (e) => ApplicationCommandSubcommandOption.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandSubcommandGroupOption? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandSubcommandGroupOption.fromJson(json);
  }

  ApplicationCommandOptionType get type =>
      ApplicationCommandOptionType.subCommandGroup;
  final String name;
  final Map<String, String>? nameLocalizations;
  final String description;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final List<ApplicationCommandSubcommandOption>? options;

  /// Converts an [ApplicationCommandSubcommandGroupOption]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localizations': descriptionLocalizations,
      'required': required_,
      'options': options?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    mapHash(nameLocalizations),
    description,
    mapHash(descriptionLocalizations),
    required_,
    listHash(options),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandSubcommandGroupOption &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_ &&
        listsEqual(options, other.options);
  }
}
