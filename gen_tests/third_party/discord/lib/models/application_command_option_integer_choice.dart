import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/int53_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandOptionIntegerChoice {
  ApplicationCommandOptionIntegerChoice({
    required this.name,
    required this.value,
    this.nameLocalizations,
  }) {
    name.validate(minLength: 1, maxLength: 100);
    nameLocalizations?.validate(maxProperties: 34);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandOptionIntegerChoice].
  factory ApplicationCommandOptionIntegerChoice.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandOptionIntegerChoice',
      json,
      () => ApplicationCommandOptionIntegerChoice(
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        value: Int53Type.fromJson(json['value'] as int),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandOptionIntegerChoice? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandOptionIntegerChoice.fromJson(json);
  }

  final String name;
  final Map<String, String>? nameLocalizations;
  final Int53Type value;

  /// Converts an [ApplicationCommandOptionIntegerChoice]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'name_localizations': nameLocalizations,
      'value': value.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, mapHash(nameLocalizations), value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandOptionIntegerChoice &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        value == other.value;
  }
}
