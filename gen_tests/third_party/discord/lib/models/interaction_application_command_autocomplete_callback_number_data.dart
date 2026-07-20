import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_number_choice.dart';
import 'package:meta/meta.dart';

@immutable
class InteractionApplicationCommandAutocompleteCallbackNumberData {
  InteractionApplicationCommandAutocompleteCallbackNumberData({this.choices}) {
    choices?.validate(maxItems: 25);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [InteractionApplicationCommandAutocompleteCallbackNumberData].
  factory InteractionApplicationCommandAutocompleteCallbackNumberData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'InteractionApplicationCommandAutocompleteCallbackNumberData',
      json,
      () => InteractionApplicationCommandAutocompleteCallbackNumberData(
        choices: (json['choices'] as List?)
            ?.map<ApplicationCommandOptionNumberChoice>(
              (e) => ApplicationCommandOptionNumberChoice.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionApplicationCommandAutocompleteCallbackNumberData?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionApplicationCommandAutocompleteCallbackNumberData.fromJson(
      json,
    );
  }

  final List<ApplicationCommandOptionNumberChoice>? choices;

  /// Converts an [InteractionApplicationCommandAutocompleteCallbackNumberData]
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
            is InteractionApplicationCommandAutocompleteCallbackNumberData &&
        listsEqual(choices, other.choices);
  }
}
