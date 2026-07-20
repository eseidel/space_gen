import 'package:discord/api_exception.dart';
import 'package:discord/messages/message_allowed_mentions_request.dart';
import 'package:discord/messages/message_attachment_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_edit_request_partial_components_inner.dart';
import 'package:discord/models/rich_embed.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEditRequestPartial {
  MessageEditRequestPartial({
    this.content,
    this.embeds,
    this.flags,
    this.allowedMentions,
    this.stickerIds,
    this.components,
    this.attachments,
  }) {
    content?.validate(maxLength: 4000);
    embeds?.validate(maxItems: 10);
    stickerIds?.validate(maxItems: 1521);
    components?.validate(maxItems: 40);
    attachments?.validate(maxItems: 10);
  }

  /// Converts a `Map<String, dynamic>` to a [MessageEditRequestPartial].
  factory MessageEditRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEditRequestPartial',
      json,
      () => MessageEditRequestPartial(
        content: json['content'] as String?,
        embeds: (json['embeds'] as List?)
            ?.map<RichEmbed>(
              (e) => RichEmbed.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        flags: json['flags'] as int?,
        allowedMentions: MessageAllowedMentionsRequest.maybeFromJson(
          json['allowed_mentions'] as Map<String, dynamic>?,
        ),
        stickerIds: (json['sticker_ids'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        components: (json['components'] as List?)
            ?.map<MessageEditRequestPartialComponentsInner>(
              (e) => MessageEditRequestPartialComponentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        attachments: (json['attachments'] as List?)
            ?.map<MessageAttachmentRequest>(
              (e) =>
                  MessageAttachmentRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEditRequestPartial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageEditRequestPartial.fromJson(json);
  }

  final String? content;
  final List<RichEmbed>? embeds;
  final int? flags;
  final MessageAllowedMentionsRequest? allowedMentions;
  final List<SnowflakeType>? stickerIds;
  final List<MessageEditRequestPartialComponentsInner>? components;
  final List<MessageAttachmentRequest>? attachments;

  /// Converts a [MessageEditRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'embeds': embeds?.map((e) => e.toJson()).toList(),
      'flags': flags,
      'allowed_mentions': allowedMentions?.toJson(),
      'sticker_ids': stickerIds?.map((e) => e.toJson()).toList(),
      'components': components?.map((e) => e.toJson()).toList(),
      'attachments': attachments?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    content,
    listHash(embeds),
    flags,
    allowedMentions,
    listHash(stickerIds),
    listHash(components),
    listHash(attachments),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEditRequestPartial &&
        content == other.content &&
        listsEqual(embeds, other.embeds) &&
        flags == other.flags &&
        allowedMentions == other.allowedMentions &&
        listsEqual(stickerIds, other.stickerIds) &&
        listsEqual(components, other.components) &&
        listsEqual(attachments, other.attachments);
  }
}
