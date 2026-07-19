import 'package:discord/messages/application_command_option_integer_choice_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:discord/models/int53_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandIntegerOptionResponse {
  const ApplicationCommandIntegerOptionResponse({
    required this.name,
    required this.description,
    this.nameLocalized,
    this.nameLocalizations,
    this.descriptionLocalized,
    this.descriptionLocalizations,
    this.required_,
    this.autocomplete,
    this.choices,
    this.minValue,
    this.maxValue,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandIntegerOptionResponse].
  factory ApplicationCommandIntegerOptionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandIntegerOptionResponse',
      json,
      () => ApplicationCommandIntegerOptionResponse(
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
        autocomplete: json['autocomplete'] as bool?,
        choices: (json['choices'] as List?)
            ?.map<ApplicationCommandOptionIntegerChoiceResponse>(
              (e) => ApplicationCommandOptionIntegerChoiceResponse.fromJson(
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
  static ApplicationCommandIntegerOptionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandIntegerOptionResponse.fromJson(json);
  }

  ApplicationCommandOptionType get type => ApplicationCommandOptionType.integer;
  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final String description;
  final String? descriptionLocalized;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final bool? autocomplete;
  final List<ApplicationCommandOptionIntegerChoiceResponse>? choices;
  final Int53Type? minValue;
  final Int53Type? maxValue;

  /// Converts an [ApplicationCommandIntegerOptionResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      if (nameLocalized != null) 'name_localized': nameLocalized,
      'name_localizations': nameLocalizations,
      'description': description,
      if (descriptionLocalized != null)
        'description_localized': descriptionLocalized,
      'description_localizations': descriptionLocalizations,
      if (required_ != null) 'required': required_,
      if (autocomplete != null) 'autocomplete': autocomplete,
      if (choices != null) 'choices': choices?.map((e) => e.toJson()).toList(),
      if (minValue != null) 'min_value': minValue?.toJson(),
      if (maxValue != null) 'max_value': maxValue?.toJson(),
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
    autocomplete,
    listHash(choices),
    minValue,
    maxValue,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandIntegerOptionResponse &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        descriptionLocalized == other.descriptionLocalized &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_ &&
        autocomplete == other.autocomplete &&
        listsEqual(choices, other.choices) &&
        minValue == other.minValue &&
        maxValue == other.maxValue;
  }
}
