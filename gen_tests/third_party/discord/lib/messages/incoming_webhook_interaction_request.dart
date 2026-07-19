import 'package:discord/messages/message_allowed_mentions_request.dart';
import 'package:discord/messages/message_attachment_request.dart';
import 'package:discord/messages/poll_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/incoming_webhook_interaction_request_components_inner.dart';
import 'package:discord/models/rich_embed.dart';
import 'package:meta/meta.dart';

@immutable
class IncomingWebhookInteractionRequest {
  const IncomingWebhookInteractionRequest({
    this.content,
    this.embeds,
    this.allowedMentions,
    this.components,
    this.attachments,
    this.poll,
    this.tts,
    this.flags,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IncomingWebhookInteractionRequest].
  factory IncomingWebhookInteractionRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IncomingWebhookInteractionRequest',
      json,
      () => IncomingWebhookInteractionRequest(
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
            ?.map<IncomingWebhookInteractionRequestComponentsInner>(
              (e) => IncomingWebhookInteractionRequestComponentsInner.fromJson(
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
        poll: PollCreateRequest.maybeFromJson(
          json['poll'] as Map<String, dynamic>?,
        ),
        tts: json['tts'] as bool?,
        flags: json['flags'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookInteractionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookInteractionRequest.fromJson(json);
  }

  final String? content;
  final List<RichEmbed>? embeds;
  final MessageAllowedMentionsRequest? allowedMentions;
  final List<IncomingWebhookInteractionRequestComponentsInner>? components;
  final List<MessageAttachmentRequest>? attachments;
  final PollCreateRequest? poll;
  final bool? tts;
  final int? flags;

  /// Converts an [IncomingWebhookInteractionRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'embeds': embeds?.map((e) => e.toJson()).toList(),
      'allowed_mentions': allowedMentions?.toJson(),
      'components': components?.map((e) => e.toJson()).toList(),
      'attachments': attachments?.map((e) => e.toJson()).toList(),
      'poll': poll?.toJson(),
      'tts': tts,
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
    poll,
    tts,
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IncomingWebhookInteractionRequest &&
        content == other.content &&
        listsEqual(embeds, other.embeds) &&
        allowedMentions == other.allowedMentions &&
        listsEqual(components, other.components) &&
        listsEqual(attachments, other.attachments) &&
        poll == other.poll &&
        tts == other.tts &&
        flags == other.flags;
  }
}
