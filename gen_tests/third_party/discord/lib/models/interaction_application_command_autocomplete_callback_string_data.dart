import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_string_choice.dart';
import 'package:meta/meta.dart';

@immutable
class InteractionApplicationCommandAutocompleteCallbackStringData {
  const InteractionApplicationCommandAutocompleteCallbackStringData({
    this.choices,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [InteractionApplicationCommandAutocompleteCallbackStringData].
  factory InteractionApplicationCommandAutocompleteCallbackStringData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'InteractionApplicationCommandAutocompleteCallbackStringData',
      json,
      () => InteractionApplicationCommandAutocompleteCallbackStringData(
        choices: (json['choices'] as List?)
            ?.map<ApplicationCommandOptionStringChoice>(
              (e) => ApplicationCommandOptionStringChoice.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionApplicationCommandAutocompleteCallbackStringData?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionApplicationCommandAutocompleteCallbackStringData.fromJson(
      json,
    );
  }

  final List<ApplicationCommandOptionStringChoice>? choices;

  /// Converts an [InteractionApplicationCommandAutocompleteCallbackStringData]
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
            is InteractionApplicationCommandAutocompleteCallbackStringData &&
        listsEqual(choices, other.choices);
  }
}
