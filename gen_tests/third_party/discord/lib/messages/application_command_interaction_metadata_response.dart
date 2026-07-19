import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationCommandInteractionMetadataResponse {
  const ApplicationCommandInteractionMetadataResponse({
    required this.id,
    required this.authorizingIntegrationOwners,
    this.user,
    this.originalResponseMessageId,
    this.targetUser,
    this.targetMessageId,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandInteractionMetadataResponse].
  factory ApplicationCommandInteractionMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandInteractionMetadataResponse',
      json,
      () => ApplicationCommandInteractionMetadataResponse(
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
        targetUser: UserResponse.maybeFromJson(
          json['target_user'] as Map<String, dynamic>?,
        ),
        targetMessageId: SnowflakeType.maybeFromJson(
          json['target_message_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandInteractionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandInteractionMetadataResponse.fromJson(json);
  }

  final SnowflakeType id;
  InteractionTypes get type => InteractionTypes.applicationCommand;
  final UserResponse? user;
  final Map<String, SnowflakeType> authorizingIntegrationOwners;
  final SnowflakeType? originalResponseMessageId;
  final UserResponse? targetUser;
  final SnowflakeType? targetMessageId;

  /// Converts an [ApplicationCommandInteractionMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'user': ?user?.toJson(),
      'authorizing_integration_owners': authorizingIntegrationOwners.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'original_response_message_id': ?originalResponseMessageId?.toJson(),
      'target_user': ?targetUser?.toJson(),
      'target_message_id': ?targetMessageId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    user,
    mapHash(authorizingIntegrationOwners),
    originalResponseMessageId,
    targetUser,
    targetMessageId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandInteractionMetadataResponse &&
        id == other.id &&
        user == other.user &&
        mapsEqual(
          authorizingIntegrationOwners,
          other.authorizingIntegrationOwners,
        ) &&
        originalResponseMessageId == other.originalResponseMessageId &&
        targetUser == other.targetUser &&
        targetMessageId == other.targetMessageId;
  }
}
