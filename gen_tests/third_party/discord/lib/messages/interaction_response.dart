import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class InteractionResponse {
  const InteractionResponse({
    required this.id,
    required this.type,
    this.responseMessageId,
    this.responseMessageLoading,
    this.responseMessageEphemeral,
    this.channelId,
    this.guildId,
  });

  /// Converts a `Map<String, dynamic>` to an [InteractionResponse].
  factory InteractionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InteractionResponse',
      json,
      () => InteractionResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: InteractionTypes.fromJson(json['type'] as int),
        responseMessageId: SnowflakeType.maybeFromJson(
          json['response_message_id'] as String?,
        ),
        responseMessageLoading: json['response_message_loading'] as bool?,
        responseMessageEphemeral: json['response_message_ephemeral'] as bool?,
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionResponse.fromJson(json);
  }

  final SnowflakeType id;
  final InteractionTypes type;
  final SnowflakeType? responseMessageId;
  final bool? responseMessageLoading;
  final bool? responseMessageEphemeral;
  final SnowflakeType? channelId;
  final SnowflakeType? guildId;

  /// Converts an [InteractionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'response_message_id': responseMessageId?.toJson(),
      'response_message_loading': responseMessageLoading,
      'response_message_ephemeral': responseMessageEphemeral,
      'channel_id': channelId?.toJson(),
      'guild_id': guildId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    type,
    responseMessageId,
    responseMessageLoading,
    responseMessageEphemeral,
    channelId,
    guildId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InteractionResponse &&
        id == other.id &&
        type == other.type &&
        responseMessageId == other.responseMessageId &&
        responseMessageLoading == other.responseMessageLoading &&
        responseMessageEphemeral == other.responseMessageEphemeral &&
        channelId == other.channelId &&
        guildId == other.guildId;
  }
}
