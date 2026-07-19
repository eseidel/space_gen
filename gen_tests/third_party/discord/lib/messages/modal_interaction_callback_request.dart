import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:discord/models/modal_interaction_callback_request_data.dart';
import 'package:meta/meta.dart';

@immutable
class ModalInteractionCallbackRequest {
  const ModalInteractionCallbackRequest({required this.data});

  /// Converts a `Map<String, dynamic>` to a [ModalInteractionCallbackRequest].
  factory ModalInteractionCallbackRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ModalInteractionCallbackRequest',
      json,
      () => ModalInteractionCallbackRequest(
        data: ModalInteractionCallbackRequestData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ModalInteractionCallbackRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ModalInteractionCallbackRequest.fromJson(json);
  }

  InteractionCallbackTypes get type => InteractionCallbackTypes.modal;
  final ModalInteractionCallbackRequestData data;

  /// Converts a [ModalInteractionCallbackRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModalInteractionCallbackRequest && data == other.data;
  }
}
