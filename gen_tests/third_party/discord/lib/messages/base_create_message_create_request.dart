import 'package:discord/messages/custom_client_theme_share_request.dart';
import 'package:discord/messages/message_allowed_mentions_request.dart';
import 'package:discord/messages/message_attachment_request.dart';
import 'package:discord/messages/poll_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/base_create_message_create_request_components_inner.dart';
import 'package:discord/models/rich_embed.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BaseCreateMessageCreateRequest {
  const BaseCreateMessageCreateRequest({
    this.content,
    this.embeds,
    this.allowedMentions,
    this.stickerIds,
    this.components,
    this.flags,
    this.attachments,
    this.poll,
    this.sharedClientTheme,
  });

  /// Converts a `Map<String, dynamic>` to a [BaseCreateMessageCreateRequest].
  factory BaseCreateMessageCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BaseCreateMessageCreateRequest',
      json,
      () => BaseCreateMessageCreateRequest(
        content: json['content'] as String?,
        embeds: (json['embeds'] as List?)
            ?.map<RichEmbed>(
              (e) => RichEmbed.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        allowedMentions: MessageAllowedMentionsRequest.maybeFromJson(
          json['allowed_mentions'] as Map<String, dynamic>?,
        ),
        stickerIds: (json['sticker_ids'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        components: (json['components'] as List?)
            ?.map<BaseCreateMessageCreateRequestComponentsInner>(
              (e) => BaseCreateMessageCreateRequestComponentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        flags: json['flags'] as int?,
        attachments: (json['attachments'] as List?)
            ?.map<MessageAttachmentRequest>(
              (e) =>
                  MessageAttachmentRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        poll: PollCreateRequest.maybeFromJson(
          json['poll'] as Map<String, dynamic>?,
        ),
        sharedClientTheme: CustomClientThemeShareRequest.maybeFromJson(
          json['shared_client_theme'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BaseCreateMessageCreateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BaseCreateMessageCreateRequest.fromJson(json);
  }

  final String? content;
  final List<RichEmbed>? embeds;
  final MessageAllowedMentionsRequest? allowedMentions;
  final List<SnowflakeType>? stickerIds;
  final List<BaseCreateMessageCreateRequestComponentsInner>? components;
  final int? flags;
  final List<MessageAttachmentRequest>? attachments;
  final PollCreateRequest? poll;
  final CustomClientThemeShareRequest? sharedClientTheme;

  /// Converts a [BaseCreateMessageCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'embeds': embeds?.map((e) => e.toJson()).toList(),
      'allowed_mentions': allowedMentions?.toJson(),
      'sticker_ids': stickerIds?.map((e) => e.toJson()).toList(),
      'components': components?.map((e) => e.toJson()).toList(),
      'flags': flags,
      'attachments': attachments?.map((e) => e.toJson()).toList(),
      'poll': poll?.toJson(),
      'shared_client_theme': sharedClientTheme?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    content,
    listHash(embeds),
    allowedMentions,
    listHash(stickerIds),
    listHash(components),
    flags,
    listHash(attachments),
    poll,
    sharedClientTheme,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BaseCreateMessageCreateRequest &&
        content == other.content &&
        listsEqual(embeds, other.embeds) &&
        allowedMentions == other.allowedMentions &&
        listsEqual(stickerIds, other.stickerIds) &&
        listsEqual(components, other.components) &&
        flags == other.flags &&
        listsEqual(attachments, other.attachments) &&
        poll == other.poll &&
        sharedClientTheme == other.sharedClientTheme;
  }
}
