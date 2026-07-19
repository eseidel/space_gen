import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class LobbyMessageResponse {
  const LobbyMessageResponse({
    required this.id,
    required this.type,
    required this.content,
    required this.lobbyId,
    required this.channelId,
    required this.author,
    required this.flags,
    this.metadata,
    this.moderationMetadata,
    this.applicationId,
  });

  /// Converts a `Map<String, dynamic>` to a [LobbyMessageResponse].
  factory LobbyMessageResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LobbyMessageResponse',
      json,
      () => LobbyMessageResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: MessageType.fromJson(json['type'] as int),
        content: json['content'] as String,
        lobbyId: SnowflakeType.fromJson(json['lobby_id'] as String),
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        author: UserResponse.fromJson(json['author'] as Map<String, dynamic>),
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        moderationMetadata:
            (json['moderation_metadata'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        flags: json['flags'] as int,
        applicationId: SnowflakeType.maybeFromJson(
          json['application_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LobbyMessageResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LobbyMessageResponse.fromJson(json);
  }

  final SnowflakeType id;
  final MessageType type;
  final String content;
  final SnowflakeType lobbyId;
  final SnowflakeType channelId;
  final UserResponse author;
  final Map<String, String>? metadata;
  final Map<String, String>? moderationMetadata;
  final int flags;
  final SnowflakeType? applicationId;

  /// Converts a [LobbyMessageResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'content': content,
      'lobby_id': lobbyId.toJson(),
      'channel_id': channelId.toJson(),
      'author': author.toJson(),
      if (metadata != null) 'metadata': metadata,
      if (moderationMetadata != null) 'moderation_metadata': moderationMetadata,
      'flags': flags,
      if (applicationId != null) 'application_id': applicationId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    type,
    content,
    lobbyId,
    channelId,
    author,
    mapHash(metadata),
    mapHash(moderationMetadata),
    flags,
    applicationId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LobbyMessageResponse &&
        id == other.id &&
        type == other.type &&
        content == other.content &&
        lobbyId == other.lobbyId &&
        channelId == other.channelId &&
        author == other.author &&
        mapsEqual(metadata, other.metadata) &&
        mapsEqual(moderationMetadata, other.moderationMetadata) &&
        flags == other.flags &&
        applicationId == other.applicationId;
  }
}
