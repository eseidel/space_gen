import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandOptionNumberChoiceResponse {
  const ApplicationCommandOptionNumberChoiceResponse({
    required this.name,
    required this.value,
    this.nameLocalized,
    this.nameLocalizations,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandOptionNumberChoiceResponse].
  factory ApplicationCommandOptionNumberChoiceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandOptionNumberChoiceResponse',
      json,
      () => ApplicationCommandOptionNumberChoiceResponse(
        name: json['name'] as String,
        nameLocalized: json['name_localized'] as String?,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        value: (json['value'] as num).toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandOptionNumberChoiceResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandOptionNumberChoiceResponse.fromJson(json);
  }

  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final double value;

  /// Converts an [ApplicationCommandOptionNumberChoiceResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'name_localized': ?nameLocalized,
      'name_localizations': nameLocalizations,
      'value': value,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, nameLocalized, mapHash(nameLocalizations), value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandOptionNumberChoiceResponse &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        value == other.value;
  }
}
