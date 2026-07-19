import 'package:discord/messages/incoming_webhook_interaction_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:meta/meta.dart';

@immutable
class CreateMessageInteractionCallbackRequest {
  const CreateMessageInteractionCallbackRequest({
    required this.type,
    this.data,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateMessageInteractionCallbackRequest].
  factory CreateMessageInteractionCallbackRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateMessageInteractionCallbackRequest',
      json,
      () => CreateMessageInteractionCallbackRequest(
        type: InteractionCallbackTypes.fromJson(json['type'] as int),
        data: IncomingWebhookInteractionRequest.maybeFromJson(
          json['data'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateMessageInteractionCallbackRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateMessageInteractionCallbackRequest.fromJson(json);
  }

  final InteractionCallbackTypes type;
  final IncomingWebhookInteractionRequest? data;

  /// Converts a [CreateMessageInteractionCallbackRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'data': data?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, data]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateMessageInteractionCallbackRequest &&
        type == other.type &&
        data == other.data;
  }
}
