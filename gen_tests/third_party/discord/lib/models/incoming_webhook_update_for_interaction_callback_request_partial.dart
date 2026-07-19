// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/message_allowed_mentions_request.dart';
import 'package:discord/messages/message_attachment_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/incoming_webhook_update_for_interaction_callback_request_partial_components_inner.dart';
import 'package:discord/models/rich_embed.dart';
import 'package:meta/meta.dart';

@immutable
class IncomingWebhookUpdateForInteractionCallbackRequestPartial {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartial({
    this.content,
    this.embeds,
    this.allowedMentions,
    this.components,
    this.attachments,
    this.flags,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IncomingWebhookUpdateForInteractionCallbackRequestPartial].
  factory IncomingWebhookUpdateForInteractionCallbackRequestPartial.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IncomingWebhookUpdateForInteractionCallbackRequestPartial',
      json,
      () => IncomingWebhookUpdateForInteractionCallbackRequestPartial(
        content: json['content'] as String?,
        embeds: (json['embeds'] as List?)
            ?.map<RichEmbed>(
              (e) => RichEmbed.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        allowedMentions: MessageAllowedMentionsRequest.maybeFromJson(
          json['allowed_mentions'] as Map<String, dynamic>?,
        ),
        components: (json['components'] as List?)
            ?.map<
              IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner
            >(
              (e) =>
                  IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner.fromJson(
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
        flags: json['flags'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookUpdateForInteractionCallbackRequestPartial?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookUpdateForInteractionCallbackRequestPartial.fromJson(
      json,
    );
  }

  final String? content;
  final List<RichEmbed>? embeds;
  final MessageAllowedMentionsRequest? allowedMentions;
  final List<
    IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner
  >?
  components;
  final List<MessageAttachmentRequest>? attachments;
  final int? flags;

  /// Converts an [IncomingWebhookUpdateForInteractionCallbackRequestPartial]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'embeds': embeds?.map((e) => e.toJson()).toList(),
      'allowed_mentions': allowedMentions?.toJson(),
      'components': components?.map((e) => e.toJson()).toList(),
      'attachments': attachments?.map((e) => e.toJson()).toList(),
      'flags': flags,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    content,
    listHash(embeds),
    allowedMentions,
    listHash(components),
    listHash(attachments),
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IncomingWebhookUpdateForInteractionCallbackRequestPartial &&
        content == other.content &&
        listsEqual(embeds, other.embeds) &&
        allowedMentions == other.allowedMentions &&
        listsEqual(components, other.components) &&
        listsEqual(attachments, other.attachments) &&
        flags == other.flags;
  }
}
