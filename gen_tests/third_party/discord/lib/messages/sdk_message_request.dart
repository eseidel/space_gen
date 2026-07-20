import 'package:discord/api_exception.dart';
import 'package:discord/messages/custom_client_theme_share_request.dart';
import 'package:discord/messages/message_allowed_mentions_request.dart';
import 'package:discord/messages/message_attachment_request.dart';
import 'package:discord/messages/message_reference_request.dart';
import 'package:discord/messages/poll_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/rich_embed.dart';
import 'package:discord/models/sdk_message_request_components_inner.dart';
import 'package:discord/models/sdk_message_request_nonce.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class SdkMessageRequest {
  SdkMessageRequest({
    this.content,
    this.embeds,
    this.allowedMentions,
    this.stickerIds,
    this.components,
    this.flags,
    this.attachments,
    this.poll,
    this.sharedClientTheme,
    this.messageReference,
    this.nonce,
    this.enforceNonce,
    this.tts,
  }) {
    content?.validate(maxLength: 4000);
    embeds?.validate(maxItems: 10);
    stickerIds?.validate(maxItems: 3);
    components?.validate(maxItems: 40);
    attachments?.validate(maxItems: 10);
  }

  /// Converts a `Map<String, dynamic>` to a [SdkMessageRequest].
  factory SdkMessageRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SdkMessageRequest',
      json,
      () => SdkMessageRequest(
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
            ?.map<SdkMessageRequestComponentsInner>(
              (e) => SdkMessageRequestComponentsInner.fromJson(
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
        messageReference: MessageReferenceRequest.maybeFromJson(
          json['message_reference'] as Map<String, dynamic>?,
        ),
        nonce: SdkMessageRequestNonce.maybeFromJson(
          json['nonce'] as Map<String, dynamic>?,
        ),
        enforceNonce: json['enforce_nonce'] as bool?,
        tts: json['tts'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SdkMessageRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SdkMessageRequest.fromJson(json);
  }

  final String? content;
  final List<RichEmbed>? embeds;
  final MessageAllowedMentionsRequest? allowedMentions;
  final List<SnowflakeType>? stickerIds;
  final List<SdkMessageRequestComponentsInner>? components;
  final int? flags;
  final List<MessageAttachmentRequest>? attachments;
  final PollCreateRequest? poll;
  final CustomClientThemeShareRequest? sharedClientTheme;
  final MessageReferenceRequest? messageReference;
  final SdkMessageRequestNonce? nonce;
  final bool? enforceNonce;
  final bool? tts;

  /// Converts a [SdkMessageRequest] to a `Map<String, dynamic>`.
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
      'message_reference': messageReference?.toJson(),
      'nonce': nonce?.toJson(),
      'enforce_nonce': enforceNonce,
      'tts': tts,
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
    messageReference,
    nonce,
    enforceNonce,
    tts,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SdkMessageRequest &&
        content == other.content &&
        listsEqual(embeds, other.embeds) &&
        allowedMentions == other.allowedMentions &&
        listsEqual(stickerIds, other.stickerIds) &&
        listsEqual(components, other.components) &&
        flags == other.flags &&
        listsEqual(attachments, other.attachments) &&
        poll == other.poll &&
        sharedClientTheme == other.sharedClientTheme &&
        messageReference == other.messageReference &&
        nonce == other.nonce &&
        enforceNonce == other.enforceNonce &&
        tts == other.tts;
  }
}
