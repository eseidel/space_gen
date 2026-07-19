import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandAttachmentOptionResponse {
  const ApplicationCommandAttachmentOptionResponse({
    required this.name,
    required this.description,
    this.nameLocalized,
    this.nameLocalizations,
    this.descriptionLocalized,
    this.descriptionLocalizations,
    this.required_,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandAttachmentOptionResponse].
  factory ApplicationCommandAttachmentOptionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandAttachmentOptionResponse',
      json,
      () => ApplicationCommandAttachmentOptionResponse(
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
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandAttachmentOptionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandAttachmentOptionResponse.fromJson(json);
  }

  ApplicationCommandOptionType get type =>
      ApplicationCommandOptionType.attachment;
  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final String description;
  final String? descriptionLocalized;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;

  /// Converts an [ApplicationCommandAttachmentOptionResponse]
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
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandAttachmentOptionResponse &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        descriptionLocalized == other.descriptionLocalized &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_;
  }
}
