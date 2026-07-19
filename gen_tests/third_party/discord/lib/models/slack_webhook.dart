import 'package:discord/model_helpers.dart';
import 'package:discord/models/webhook_slack_embed.dart';
import 'package:meta/meta.dart';

@immutable
class SlackWebhook {
  const SlackWebhook({
    this.text,
    this.username,
    this.iconUrl,
    this.attachments,
  });

  /// Converts a `Map<String, dynamic>` to a [SlackWebhook].
  factory SlackWebhook.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SlackWebhook',
      json,
      () => SlackWebhook(
        text: json['text'] as String?,
        username: json['username'] as String?,
        iconUrl: maybeParseUri(json['icon_url'] as String?),
        attachments: (json['attachments'] as List?)
            ?.map<WebhookSlackEmbed>(
              (e) => WebhookSlackEmbed.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SlackWebhook? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SlackWebhook.fromJson(json);
  }

  final String? text;
  final String? username;
  final Uri? iconUrl;
  final List<WebhookSlackEmbed>? attachments;

  /// Converts a [SlackWebhook] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'username': username,
      'icon_url': iconUrl?.toString(),
      'attachments': attachments?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([text, username, iconUrl, listHash(attachments)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SlackWebhook &&
        text == other.text &&
        username == other.username &&
        iconUrl == other.iconUrl &&
        listsEqual(attachments, other.attachments);
  }
}
