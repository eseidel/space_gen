// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/model_helpers.dart';
import 'package:discord/models/incoming_webhook_update_for_interaction_callback_request_partial.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateMessageInteractionCallbackRequest {
  const UpdateMessageInteractionCallbackRequest({
    required this.type,
    this.data,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UpdateMessageInteractionCallbackRequest].
  factory UpdateMessageInteractionCallbackRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UpdateMessageInteractionCallbackRequest',
      json,
      () => UpdateMessageInteractionCallbackRequest(
        type: InteractionCallbackTypes.fromJson(json['type'] as int),
        data:
            IncomingWebhookUpdateForInteractionCallbackRequestPartial.maybeFromJson(
              json['data'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateMessageInteractionCallbackRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateMessageInteractionCallbackRequest.fromJson(json);
  }

  final InteractionCallbackTypes type;
  final IncomingWebhookUpdateForInteractionCallbackRequestPartial? data;

  /// Converts a [UpdateMessageInteractionCallbackRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'data': data?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, data]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateMessageInteractionCallbackRequest &&
        type == other.type &&
        data == other.data;
  }
}
