import 'package:discord/messages/application_command_option_number_choice_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandNumberOptionResponse {
  const ApplicationCommandNumberOptionResponse({
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
  /// [ApplicationCommandNumberOptionResponse].
  factory ApplicationCommandNumberOptionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandNumberOptionResponse',
      json,
      () => ApplicationCommandNumberOptionResponse(
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
            ?.map<ApplicationCommandOptionNumberChoiceResponse>(
              (e) => ApplicationCommandOptionNumberChoiceResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        minValue: (json['min_value'] as num?)?.toDouble(),
        maxValue: (json['max_value'] as num?)?.toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandNumberOptionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandNumberOptionResponse.fromJson(json);
  }

  ApplicationCommandOptionType get type => ApplicationCommandOptionType.number;
  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final String description;
  final String? descriptionLocalized;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final bool? autocomplete;
  final List<ApplicationCommandOptionNumberChoiceResponse>? choices;
  final double? minValue;
  final double? maxValue;

  /// Converts an [ApplicationCommandNumberOptionResponse]
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
      'autocomplete': autocomplete,
      'choices': choices?.map((e) => e.toJson()).toList(),
      'min_value': minValue,
      'max_value': maxValue,
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
    return other is ApplicationCommandNumberOptionResponse &&
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
