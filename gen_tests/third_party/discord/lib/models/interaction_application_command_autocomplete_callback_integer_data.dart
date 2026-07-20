// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_integer_choice.dart';
import 'package:meta/meta.dart';

@immutable
class InteractionApplicationCommandAutocompleteCallbackIntegerData {
  InteractionApplicationCommandAutocompleteCallbackIntegerData({this.choices}) {
    choices?.validate(maxItems: 25);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [InteractionApplicationCommandAutocompleteCallbackIntegerData].
  factory InteractionApplicationCommandAutocompleteCallbackIntegerData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'InteractionApplicationCommandAutocompleteCallbackIntegerData',
      json,
      () => InteractionApplicationCommandAutocompleteCallbackIntegerData(
        choices: (json['choices'] as List?)
            ?.map<ApplicationCommandOptionIntegerChoice>(
              (e) => ApplicationCommandOptionIntegerChoice.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionApplicationCommandAutocompleteCallbackIntegerData?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionApplicationCommandAutocompleteCallbackIntegerData.fromJson(
      json,
    );
  }

  final List<ApplicationCommandOptionIntegerChoice>? choices;

  /// Converts an [InteractionApplicationCommandAutocompleteCallbackIntegerData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'choices': choices?.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(choices).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is InteractionApplicationCommandAutocompleteCallbackIntegerData &&
        listsEqual(choices, other.choices);
  }
}
