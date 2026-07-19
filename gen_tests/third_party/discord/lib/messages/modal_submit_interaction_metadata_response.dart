// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_types.dart';
import 'package:discord/models/modal_submit_interaction_metadata_response_triggering_interaction_metadata.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ModalSubmitInteractionMetadataResponse {
  const ModalSubmitInteractionMetadataResponse({
    required this.id,
    required this.authorizingIntegrationOwners,
    required this.triggeringInteractionMetadata,
    this.user,
    this.originalResponseMessageId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ModalSubmitInteractionMetadataResponse].
  factory ModalSubmitInteractionMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ModalSubmitInteractionMetadataResponse',
      json,
      () => ModalSubmitInteractionMetadataResponse(
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
        triggeringInteractionMetadata:
            ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata.fromJson(
              json['triggering_interaction_metadata'] as Map<String, dynamic>,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ModalSubmitInteractionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ModalSubmitInteractionMetadataResponse.fromJson(json);
  }

  final SnowflakeType id;
  InteractionTypes get type => InteractionTypes.modalSubmit;
  final UserResponse? user;
  final Map<String, SnowflakeType> authorizingIntegrationOwners;
  final SnowflakeType? originalResponseMessageId;
  final ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata
  triggeringInteractionMetadata;

  /// Converts a [ModalSubmitInteractionMetadataResponse]
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
      'triggering_interaction_metadata': triggeringInteractionMetadata.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    user,
    mapHash(authorizingIntegrationOwners),
    originalResponseMessageId,
    triggeringInteractionMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModalSubmitInteractionMetadataResponse &&
        id == other.id &&
        user == other.user &&
        mapsEqual(
          authorizingIntegrationOwners,
          other.authorizingIntegrationOwners,
        ) &&
        originalResponseMessageId == other.originalResponseMessageId &&
        triggeringInteractionMetadata == other.triggeringInteractionMetadata;
  }
}
