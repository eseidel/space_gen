import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageComponentInteractionMetadataResponse {
  const MessageComponentInteractionMetadataResponse({
    required this.id,
    required this.authorizingIntegrationOwners,
    required this.interactedMessageId,
    this.user,
    this.originalResponseMessageId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MessageComponentInteractionMetadataResponse].
  factory MessageComponentInteractionMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MessageComponentInteractionMetadataResponse',
      json,
      () => MessageComponentInteractionMetadataResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
        authorizingIntegrationOwners:
            (json['authorizing_integration_owners'] as Map<String, dynamic>)
                .map(
                  (key, value) =>
                      MapEntry(key, SnowflakeType.fromJson(value as String)),
                ),
        originalResponseMessageId: SnowflakeType.maybeFromJson(
          json['original_response_message_id'] as String?,
        ),
        interactedMessageId: SnowflakeType.fromJson(
          json['interacted_message_id'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageComponentInteractionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageComponentInteractionMetadataResponse.fromJson(json);
  }

  final SnowflakeType id;
  InteractionTypes get type => InteractionTypes.messageComponent;
  final UserResponse? user;
  final Map<String, SnowflakeType> authorizingIntegrationOwners;
  final SnowflakeType? originalResponseMessageId;
  final SnowflakeType interactedMessageId;

  /// Converts a [MessageComponentInteractionMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      if (user != null) 'user': user?.toJson(),
      'authorizing_integration_owners': authorizingIntegrationOwners.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      if (originalResponseMessageId != null)
        'original_response_message_id': originalResponseMessageId?.toJson(),
      'interacted_message_id': interactedMessageId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    user,
    mapHash(authorizingIntegrationOwners),
    originalResponseMessageId,
    interactedMessageId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageComponentInteractionMetadataResponse &&
        id == other.id &&
        user == other.user &&
        mapsEqual(
          authorizingIntegrationOwners,
          other.authorizingIntegrationOwners,
        ) &&
        originalResponseMessageId == other.originalResponseMessageId &&
        interactedMessageId == other.interactedMessageId;
  }
}
