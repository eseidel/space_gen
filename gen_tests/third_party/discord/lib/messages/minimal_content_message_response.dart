import 'package:discord/messages/message_attachment_response.dart';
import 'package:discord/messages/message_embed_response.dart';
import 'package:discord/messages/message_sticker_item_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_type.dart';
import 'package:discord/models/minimal_content_message_response_components_inner.dart';
import 'package:discord/models/minimal_content_message_response_stickers_inner.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MinimalContentMessageResponse {
  const MinimalContentMessageResponse({
    required this.type,
    required this.content,
    required this.mentions,
    required this.mentionRoles,
    required this.attachments,
    required this.embeds,
    required this.timestamp,
    required this.editedTimestamp,
    required this.flags,
    required this.components,
    this.stickers,
    this.stickerItems,
  });

  /// Converts a `Map<String, dynamic>` to a [MinimalContentMessageResponse].
  factory MinimalContentMessageResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MinimalContentMessageResponse',
      json,
      () => MinimalContentMessageResponse(
        type: MessageType.fromJson(json['type'] as int),
        content: json['content'] as String,
        mentions: (json['mentions'] as List)
            .map<UserResponse>(
              (e) => UserResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        mentionRoles: (json['mention_roles'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        attachments: (json['attachments'] as List)
            .map<MessageAttachmentResponse>(
              (e) =>
                  MessageAttachmentResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        embeds: (json['embeds'] as List)
            .map<MessageEmbedResponse>(
              (e) => MessageEmbedResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        timestamp: DateTime.parse(json['timestamp'] as String),
        editedTimestamp: maybeParseDateTime(
          checkedKey(json, 'edited_timestamp') as String?,
        ),
        flags: json['flags'] as int,
        components: (json['components'] as List)
            .map<MinimalContentMessageResponseComponentsInner>(
              (e) => MinimalContentMessageResponseComponentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        stickers: (json['stickers'] as List?)
            ?.map<MinimalContentMessageResponseStickersInner>(
              (e) => MinimalContentMessageResponseStickersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        stickerItems: (json['sticker_items'] as List?)
            ?.map<MessageStickerItemResponse>(
              (e) => MessageStickerItemResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MinimalContentMessageResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MinimalContentMessageResponse.fromJson(json);
  }

  final MessageType type;
  final String content;
  final List<UserResponse> mentions;
  final List<SnowflakeType> mentionRoles;
  final List<MessageAttachmentResponse> attachments;
  final List<MessageEmbedResponse> embeds;
  final DateTime timestamp;
  final DateTime? editedTimestamp;
  final int flags;
  final List<MinimalContentMessageResponseComponentsInner> components;
  final List<MinimalContentMessageResponseStickersInner>? stickers;
  final List<MessageStickerItemResponse>? stickerItems;

  /// Converts a [MinimalContentMessageResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'content': content,
      'mentions': mentions.map((e) => e.toJson()).toList(),
      'mention_roles': mentionRoles.map((e) => e.toJson()).toList(),
      'attachments': attachments.map((e) => e.toJson()).toList(),
      'embeds': embeds.map((e) => e.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
      'edited_timestamp': editedTimestamp?.toIso8601String(),
      'flags': flags,
      'components': components.map((e) => e.toJson()).toList(),
      if (stickers != null)
        'stickers': stickers?.map((e) => e.toJson()).toList(),
      if (stickerItems != null)
        'sticker_items': stickerItems?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    content,
    listHash(mentions),
    listHash(mentionRoles),
    listHash(attachments),
    listHash(embeds),
    timestamp,
    editedTimestamp,
    flags,
    listHash(components),
    listHash(stickers),
    listHash(stickerItems),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MinimalContentMessageResponse &&
        type == other.type &&
        content == other.content &&
        listsEqual(mentions, other.mentions) &&
        listsEqual(mentionRoles, other.mentionRoles) &&
        listsEqual(attachments, other.attachments) &&
        listsEqual(embeds, other.embeds) &&
        timestamp == other.timestamp &&
        editedTimestamp == other.editedTimestamp &&
        flags == other.flags &&
        listsEqual(components, other.components) &&
        listsEqual(stickers, other.stickers) &&
        listsEqual(stickerItems, other.stickerItems);
  }
}
