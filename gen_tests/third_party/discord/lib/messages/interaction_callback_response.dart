import 'package:discord/messages/interaction_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_response_resource.dart';
import 'package:meta/meta.dart';

@immutable
class InteractionCallbackResponse {
  const InteractionCallbackResponse({required this.interaction, this.resource});

  /// Converts a `Map<String, dynamic>` to an [InteractionCallbackResponse].
  factory InteractionCallbackResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InteractionCallbackResponse',
      json,
      () => InteractionCallbackResponse(
        interaction: InteractionResponse.fromJson(
          json['interaction'] as Map<String, dynamic>,
        ),
        resource: InteractionCallbackResponseResource.maybeFromJson(
          json['resource'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionCallbackResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InteractionCallbackResponse.fromJson(json);
  }

  final InteractionResponse interaction;
  final InteractionCallbackResponseResource? resource;

  /// Converts an [InteractionCallbackResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'interaction': interaction.toJson(),
      'resource': resource?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([interaction, resource]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InteractionCallbackResponse &&
        interaction == other.interaction &&
        resource == other.resource;
  }
}
