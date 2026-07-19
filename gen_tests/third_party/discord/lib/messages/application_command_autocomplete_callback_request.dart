import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_autocomplete_callback_request_data.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandAutocompleteCallbackRequest {
  const ApplicationCommandAutocompleteCallbackRequest({required this.data});

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandAutocompleteCallbackRequest].
  factory ApplicationCommandAutocompleteCallbackRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandAutocompleteCallbackRequest',
      json,
      () => ApplicationCommandAutocompleteCallbackRequest(
        data: ApplicationCommandAutocompleteCallbackRequestData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandAutocompleteCallbackRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandAutocompleteCallbackRequest.fromJson(json);
  }

  InteractionCallbackTypes get type =>
      InteractionCallbackTypes.applicationCommandAutocompleteResult;
  final ApplicationCommandAutocompleteCallbackRequestData data;

  /// Converts an [ApplicationCommandAutocompleteCallbackRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandAutocompleteCallbackRequest &&
        data == other.data;
  }
}
