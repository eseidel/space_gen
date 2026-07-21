import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandRoleOption {
  ApplicationCommandRoleOption({
    required this.name,
    required this.description,
    this.nameLocalizations,
    this.descriptionLocalizations,
    this.required_,
  }) {
    name.validate(minLength: 1, maxLength: 32);
    nameLocalizations?.validate(maxProperties: 34);
    description.validate(minLength: 1, maxLength: 100);
    descriptionLocalizations?.validate(maxProperties: 34);
  }

  /// Converts a `Map<String, dynamic>` to an [ApplicationCommandRoleOption].
  factory ApplicationCommandRoleOption.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationCommandRoleOption',
      json,
      () => ApplicationCommandRoleOption(
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        required_: json['required'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandRoleOption? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandRoleOption.fromJson(json);
  }

  ApplicationCommandOptionType get type => ApplicationCommandOptionType.role;
  final String name;
  final Map<String, String>? nameLocalizations;
  final String description;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;

  /// Converts an [ApplicationCommandRoleOption] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localizations': descriptionLocalizations,
      'required': required_,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    mapHash(nameLocalizations),
    description,
    mapHash(descriptionLocalizations),
    required_,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandRoleOption &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_;
  }
}
