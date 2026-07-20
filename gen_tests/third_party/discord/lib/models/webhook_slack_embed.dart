import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/webhook_slack_embed_field.dart';
import 'package:meta/meta.dart';

@immutable
class WebhookSlackEmbed {
  WebhookSlackEmbed({
    this.title,
    this.titleLink,
    this.text,
    this.color,
    this.ts,
    this.pretext,
    this.footer,
    this.footerIcon,
    this.authorName,
    this.authorLink,
    this.authorIcon,
    this.imageUrl,
    this.thumbUrl,
    this.fields,
  }) {
    title?.validate(maxLength: 152133);
    text?.validate(maxLength: 152133);
    color?.validate(
      maxLength: 7,
      pattern: r'^#(([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3})$',
    );
    pretext?.validate(maxLength: 152133);
    footer?.validate(maxLength: 152133);
    authorName?.validate(maxLength: 152133);
    fields?.validate(maxItems: 1521);
  }

  /// Converts a `Map<String, dynamic>` to a [WebhookSlackEmbed].
  factory WebhookSlackEmbed.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WebhookSlackEmbed',
      json,
      () => WebhookSlackEmbed(
        title: json['title'] as String?,
        titleLink: maybeParseUri(json['title_link'] as String?),
        text: json['text'] as String?,
        color: json['color'] as String?,
        ts: json['ts'] as int?,
        pretext: json['pretext'] as String?,
        footer: json['footer'] as String?,
        footerIcon: maybeParseUri(json['footer_icon'] as String?),
        authorName: json['author_name'] as String?,
        authorLink: maybeParseUri(json['author_link'] as String?),
        authorIcon: maybeParseUri(json['author_icon'] as String?),
        imageUrl: maybeParseUri(json['image_url'] as String?),
        thumbUrl: maybeParseUri(json['thumb_url'] as String?),
        fields: (json['fields'] as List?)
            ?.map<WebhookSlackEmbedField>(
              (e) => WebhookSlackEmbedField.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookSlackEmbed? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WebhookSlackEmbed.fromJson(json);
  }

  final String? title;
  final Uri? titleLink;
  final String? text;
  final String? color;
  final int? ts;
  final String? pretext;
  final String? footer;
  final Uri? footerIcon;
  final String? authorName;
  final Uri? authorLink;
  final Uri? authorIcon;
  final Uri? imageUrl;
  final Uri? thumbUrl;
  final List<WebhookSlackEmbedField>? fields;

  /// Converts a [WebhookSlackEmbed] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'title_link': titleLink?.toString(),
      'text': text,
      'color': color,
      'ts': ts,
      'pretext': pretext,
      'footer': footer,
      'footer_icon': footerIcon?.toString(),
      'author_name': authorName,
      'author_link': authorLink?.toString(),
      'author_icon': authorIcon?.toString(),
      'image_url': imageUrl?.toString(),
      'thumb_url': thumbUrl?.toString(),
      'fields': fields?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    title,
    titleLink,
    text,
    color,
    ts,
    pretext,
    footer,
    footerIcon,
    authorName,
    authorLink,
    authorIcon,
    imageUrl,
    thumbUrl,
    listHash(fields),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WebhookSlackEmbed &&
        title == other.title &&
        titleLink == other.titleLink &&
        text == other.text &&
        color == other.color &&
        ts == other.ts &&
        pretext == other.pretext &&
        footer == other.footer &&
        footerIcon == other.footerIcon &&
        authorName == other.authorName &&
        authorLink == other.authorLink &&
        authorIcon == other.authorIcon &&
        imageUrl == other.imageUrl &&
        thumbUrl == other.thumbUrl &&
        listsEqual(fields, other.fields);
  }
}
