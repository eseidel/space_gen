import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_string_choice.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandStringOption {
  const ApplicationCommandStringOption({
    required this.name,
    required this.description,
    this.nameLocalizations,
    this.descriptionLocalizations,
    this.required_,
    this.autocomplete,
    this.minLength,
    this.maxLength,
    this.choices,
  });

  /// Converts a `Map<String, dynamic>` to an [ApplicationCommandStringOption].
  factory ApplicationCommandStringOption.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationCommandStringOption',
      json,
      () => ApplicationCommandStringOption(
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        required_: json['required'] as bool?,
        autocomplete: json['autocomplete'] as bool?,
        minLength: json['min_length'] as int?,
        maxLength: json['max_length'] as int?,
        choices: (json['choices'] as List?)
            ?.map<ApplicationCommandOptionStringChoice>(
              (e) => ApplicationCommandOptionStringChoice.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandStringOption? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandStringOption.fromJson(json);
  }

  ApplicationCommandOptionType get type => ApplicationCommandOptionType.string;
  final String name;
  final Map<String, String>? nameLocalizations;
  final String description;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final bool? autocomplete;
  final int? minLength;
  final int? maxLength;
  final List<ApplicationCommandOptionStringChoice>? choices;

  /// Converts an [ApplicationCommandStringOption] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localizations': descriptionLocalizations,
      'required': required_,
      'autocomplete': autocomplete,
      'min_length': minLength,
      'max_length': maxLength,
      'choices': choices?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    mapHash(nameLocalizations),
    description,
    mapHash(descriptionLocalizations),
    required_,
    autocomplete,
    minLength,
    maxLength,
    listHash(choices),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandStringOption &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_ &&
        autocomplete == other.autocomplete &&
        minLength == other.minLength &&
        maxLength == other.maxLength &&
        listsEqual(choices, other.choices);
  }
}
