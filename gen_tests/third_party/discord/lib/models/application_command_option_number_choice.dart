import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandOptionNumberChoice {
  const ApplicationCommandOptionNumberChoice({
    required this.name,
    required this.value,
    this.nameLocalizations,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandOptionNumberChoice].
  factory ApplicationCommandOptionNumberChoice.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandOptionNumberChoice',
      json,
      () => ApplicationCommandOptionNumberChoice(
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        value: (json['value'] as num).toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandOptionNumberChoice? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandOptionNumberChoice.fromJson(json);
  }

  final String name;
  final Map<String, String>? nameLocalizations;
  final double value;

  /// Converts an [ApplicationCommandOptionNumberChoice]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'name_localizations': nameLocalizations,
      'value': value,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, mapHash(nameLocalizations), value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandOptionNumberChoice &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        value == other.value;
  }
}
