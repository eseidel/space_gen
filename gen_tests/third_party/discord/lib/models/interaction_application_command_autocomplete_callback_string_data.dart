// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_string_choice.dart';
import 'package:meta/meta.dart';

@immutable
class InteractionApplicationCommandAutocompleteCallbackStringData {
  InteractionApplicationCommandAutocompleteCallbackStringData({this.choices}) {
    choices?.validate(maxItems: 25);
  }

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
