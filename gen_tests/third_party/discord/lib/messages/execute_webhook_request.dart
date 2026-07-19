import 'package:discord/messages/message_allowed_mentions_request.dart';
import 'package:discord/messages/message_attachment_request.dart';
import 'package:discord/messages/poll_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/incoming_webhook_request_partial_components_inner.dart';
import 'package:discord/models/incoming_webhook_update_request_partial.dart';
import 'package:discord/models/rich_embed.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class ExecuteWebhookRequest {
  const ExecuteWebhookRequest();

  factory ExecuteWebhookRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('applied_tags')) {
      return IncomingWebhookRequestPartial.fromJson(json);
    }
    return ExecuteWebhookRequestIncomingWebhookUpdateRequestPartial(
      IncomingWebhookUpdateRequestPartial.fromJson(json),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExecuteWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ExecuteWebhookRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ExecuteWebhookRequestIncomingWebhookUpdateRequestPartial
    extends ExecuteWebhookRequest {
  const ExecuteWebhookRequestIncomingWebhookUpdateRequestPartial(this.value);

  final IncomingWebhookUpdateRequestPartial value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExecuteWebhookRequestIncomingWebhookUpdateRequestPartial &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartial extends ExecuteWebhookRequest {
  const IncomingWebhookRequestPartial({
    this.content,
    this.embeds,
    this.allowedMentions,
    this.components,
    this.attachments,
    this.poll,
    this.tts,
    this.flags,
    this.username,
    this.avatarUrl,
    this.threadName,
    this.appliedTags,
  });

  /// Converts a `Map<String, dynamic>` to an [IncomingWebhookRequestPartial].
  factory IncomingWebhookRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IncomingWebhookRequestPartial',
      json,
      () => IncomingWebhookRequestPartial(
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
            ?.map<IncomingWebhookRequestPartialComponentsInner>(
              (e) => IncomingWebhookRequestPartialComponentsInner.fromJson(
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
        username: json['username'] as String?,
        avatarUrl: maybeParseUri(json['avatar_url'] as String?),
        threadName: json['thread_name'] as String?,
        appliedTags: (json['applied_tags'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookRequestPartial.fromJson(json);
  }

  final String? content;
  final List<RichEmbed>? embeds;
  final MessageAllowedMentionsRequest? allowedMentions;
  final List<IncomingWebhookRequestPartialComponentsInner>? components;
  final List<MessageAttachmentRequest>? attachments;
  final PollCreateRequest? poll;
  final bool? tts;
  final int? flags;
  final String? username;
  final Uri? avatarUrl;
  final String? threadName;
  final List<SnowflakeType>? appliedTags;

  /// Converts an [IncomingWebhookRequestPartial] to a `Map<String, dynamic>`.
  @override
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
      'username': username,
      'avatar_url': avatarUrl?.toString(),
      'thread_name': threadName,
      'applied_tags': appliedTags?.map((e) => e.toJson()).toList(),
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
    username,
    avatarUrl,
    threadName,
    listHash(appliedTags),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IncomingWebhookRequestPartial &&
        content == other.content &&
        listsEqual(embeds, other.embeds) &&
        allowedMentions == other.allowedMentions &&
        listsEqual(components, other.components) &&
        listsEqual(attachments, other.attachments) &&
        poll == other.poll &&
        tts == other.tts &&
        flags == other.flags &&
        username == other.username &&
        avatarUrl == other.avatarUrl &&
        threadName == other.threadName &&
        listsEqual(appliedTags, other.appliedTags);
  }
}
