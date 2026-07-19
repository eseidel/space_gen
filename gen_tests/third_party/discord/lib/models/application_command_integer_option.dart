import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_integer_choice.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:discord/models/int53_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandIntegerOption {
  const ApplicationCommandIntegerOption({
    required this.name,
    required this.description,
    this.nameLocalizations,
    this.descriptionLocalizations,
    this.required_,
    this.autocomplete,
    this.choices,
    this.minValue,
    this.maxValue,
  });

  /// Converts a `Map<String, dynamic>` to an [ApplicationCommandIntegerOption].
  factory ApplicationCommandIntegerOption.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationCommandIntegerOption',
      json,
      () => ApplicationCommandIntegerOption(
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
        choices: (json['choices'] as List?)
            ?.map<ApplicationCommandOptionIntegerChoice>(
              (e) => ApplicationCommandOptionIntegerChoice.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        minValue: Int53Type.maybeFromJson(json['min_value'] as int?),
        maxValue: Int53Type.maybeFromJson(json['max_value'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandIntegerOption? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandIntegerOption.fromJson(json);
  }

  ApplicationCommandOptionType get type => ApplicationCommandOptionType.integer;
  final String name;
  final Map<String, String>? nameLocalizations;
  final String description;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final bool? autocomplete;
  final List<ApplicationCommandOptionIntegerChoice>? choices;
  final Int53Type? minValue;
  final Int53Type? maxValue;

  /// Converts an [ApplicationCommandIntegerOption] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localizations': descriptionLocalizations,
      'required': required_,
      'autocomplete': autocomplete,
      'choices': choices?.map((e) => e.toJson()).toList(),
      'min_value': minValue?.toJson(),
      'max_value': maxValue?.toJson(),
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
    listHash(choices),
    minValue,
    maxValue,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandIntegerOption &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_ &&
        autocomplete == other.autocomplete &&
        listsEqual(choices, other.choices) &&
        minValue == other.minValue &&
        maxValue == other.maxValue;
  }
}
