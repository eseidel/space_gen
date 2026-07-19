import 'package:discord/messages/message_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:meta/meta.dart';

sealed class InteractionCallbackResponseResource {
  const InteractionCallbackResponseResource();

  factory InteractionCallbackResponseResource.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      4 => CreateMessageInteractionCallbackResponse.fromJson(json),
      12 => LaunchActivityInteractionCallbackResponse.fromJson(json),
      7 => UpdateMessageInteractionCallbackResponse.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for InteractionCallbackResponseResource",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionCallbackResponseResource? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InteractionCallbackResponseResource.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CreateMessageInteractionCallbackResponse
    extends InteractionCallbackResponseResource {
  const CreateMessageInteractionCallbackResponse({required this.message});

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateMessageInteractionCallbackResponse].
  factory CreateMessageInteractionCallbackResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateMessageInteractionCallbackResponse',
      json,
      () => CreateMessageInteractionCallbackResponse(
        message: MessageResponse.fromJson(
          json['message'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateMessageInteractionCallbackResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateMessageInteractionCallbackResponse.fromJson(json);
  }

  InteractionCallbackTypes get type =>
      InteractionCallbackTypes.channelMessageWithSource;
  final MessageResponse message;

  /// Converts a [CreateMessageInteractionCallbackResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'message': message.toJson()};
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateMessageInteractionCallbackResponse &&
        message == other.message;
  }
}

@immutable
final class LaunchActivityInteractionCallbackResponse
    extends InteractionCallbackResponseResource {
  const LaunchActivityInteractionCallbackResponse();

  /// Converts a `Map<String, dynamic>` to a
  /// [LaunchActivityInteractionCallbackResponse].
  factory LaunchActivityInteractionCallbackResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'LaunchActivityInteractionCallbackResponse',
      json,
      LaunchActivityInteractionCallbackResponse.new,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LaunchActivityInteractionCallbackResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return LaunchActivityInteractionCallbackResponse.fromJson(json);
  }

  InteractionCallbackTypes get type => InteractionCallbackTypes.launchActivity;

  /// Converts a [LaunchActivityInteractionCallbackResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LaunchActivityInteractionCallbackResponse;
  }
}

@immutable
final class UpdateMessageInteractionCallbackResponse
    extends InteractionCallbackResponseResource {
  const UpdateMessageInteractionCallbackResponse({required this.message});

  /// Converts a `Map<String, dynamic>` to a
  /// [UpdateMessageInteractionCallbackResponse].
  factory UpdateMessageInteractionCallbackResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UpdateMessageInteractionCallbackResponse',
      json,
      () => UpdateMessageInteractionCallbackResponse(
        message: MessageResponse.fromJson(
          json['message'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateMessageInteractionCallbackResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateMessageInteractionCallbackResponse.fromJson(json);
  }

  InteractionCallbackTypes get type => InteractionCallbackTypes.updateMessage;
  final MessageResponse message;

  /// Converts a [UpdateMessageInteractionCallbackResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'message': message.toJson()};
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateMessageInteractionCallbackResponse &&
        message == other.message;
  }
}
