import 'package:discord/model_helpers.dart';
import 'package:discord/models/int53_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandOptionIntegerChoiceResponse {
  const ApplicationCommandOptionIntegerChoiceResponse({
    required this.name,
    required this.value,
    this.nameLocalized,
    this.nameLocalizations,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandOptionIntegerChoiceResponse].
  factory ApplicationCommandOptionIntegerChoiceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandOptionIntegerChoiceResponse',
      json,
      () => ApplicationCommandOptionIntegerChoiceResponse(
        name: json['name'] as String,
        nameLocalized: json['name_localized'] as String?,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        value: Int53Type.fromJson(json['value'] as int),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandOptionIntegerChoiceResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandOptionIntegerChoiceResponse.fromJson(json);
  }

  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final Int53Type value;

  /// Converts an [ApplicationCommandOptionIntegerChoiceResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (nameLocalized != null) 'name_localized': nameLocalized,
      'name_localizations': nameLocalizations,
      'value': value.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, nameLocalized, mapHash(nameLocalizations), value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandOptionIntegerChoiceResponse &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        value == other.value;
  }
}
