import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:meta/meta.dart';

@immutable
class PongInteractionCallbackRequest {
  const PongInteractionCallbackRequest();

  /// Converts a `Map<String, dynamic>` to a [PongInteractionCallbackRequest].
  factory PongInteractionCallbackRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PongInteractionCallbackRequest',
      json,
      PongInteractionCallbackRequest.new,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PongInteractionCallbackRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PongInteractionCallbackRequest.fromJson(json);
  }

  InteractionCallbackTypes get type => InteractionCallbackTypes.pong;

  /// Converts a [PongInteractionCallbackRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PongInteractionCallbackRequest;
  }
}
