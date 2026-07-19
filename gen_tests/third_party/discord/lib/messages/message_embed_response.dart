import 'package:discord/messages/container_component_response.dart';
import 'package:discord/messages/message_embed_author_response.dart';
import 'package:discord/messages/message_embed_field_response.dart';
import 'package:discord/messages/message_embed_footer_response.dart';
import 'package:discord/messages/message_embed_image_response.dart';
import 'package:discord/messages/message_embed_provider_response.dart';
import 'package:discord/messages/message_embed_video_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEmbedResponse {
  const MessageEmbedResponse({
    required this.type,
    this.url,
    this.title,
    this.description,
    this.color,
    this.timestamp,
    this.fields,
    this.author,
    this.provider,
    this.image,
    this.thumbnail,
    this.video,
    this.footer,
    this.flags,
    this.components,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageEmbedResponse].
  factory MessageEmbedResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEmbedResponse',
      json,
      () => MessageEmbedResponse(
        type: json['type'] as String,
        url: maybeParseUri(json['url'] as String?),
        title: json['title'] as String?,
        description: json['description'] as String?,
        color: json['color'] as int?,
        timestamp: maybeParseDateTime(json['timestamp'] as String?),
        fields: (json['fields'] as List?)
            ?.map<MessageEmbedFieldResponse>(
              (e) =>
                  MessageEmbedFieldResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        author: MessageEmbedAuthorResponse.maybeFromJson(
          json['author'] as Map<String, dynamic>?,
        ),
        provider: MessageEmbedProviderResponse.maybeFromJson(
          json['provider'] as Map<String, dynamic>?,
        ),
        image: MessageEmbedImageResponse.maybeFromJson(
          json['image'] as Map<String, dynamic>?,
        ),
        thumbnail: MessageEmbedImageResponse.maybeFromJson(
          json['thumbnail'] as Map<String, dynamic>?,
        ),
        video: MessageEmbedVideoResponse.maybeFromJson(
          json['video'] as Map<String, dynamic>?,
        ),
        footer: MessageEmbedFooterResponse.maybeFromJson(
          json['footer'] as Map<String, dynamic>?,
        ),
        flags: json['flags'] as int?,
        components: (json['components'] as List?)
            ?.map<ContainerComponentResponse>(
              (e) => ContainerComponentResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEmbedResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageEmbedResponse.fromJson(json);
  }

  final String type;
  final Uri? url;
  final String? title;
  final String? description;
  final int? color;
  final DateTime? timestamp;
  final List<MessageEmbedFieldResponse>? fields;
  final MessageEmbedAuthorResponse? author;
  final MessageEmbedProviderResponse? provider;
  final MessageEmbedImageResponse? image;
  final MessageEmbedImageResponse? thumbnail;
  final MessageEmbedVideoResponse? video;
  final MessageEmbedFooterResponse? footer;
  final int? flags;
  final List<ContainerComponentResponse>? components;

  /// Converts a [MessageEmbedResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url?.toString(),
      'title': title,
      'description': description,
      'color': color,
      'timestamp': timestamp?.toIso8601String(),
      'fields': fields?.map((e) => e.toJson()).toList(),
      'author': author?.toJson(),
      'provider': provider?.toJson(),
      'image': image?.toJson(),
      'thumbnail': thumbnail?.toJson(),
      'video': video?.toJson(),
      'footer': footer?.toJson(),
      'flags': flags,
      'components': components?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    url,
    title,
    description,
    color,
    timestamp,
    listHash(fields),
    author,
    provider,
    image,
    thumbnail,
    video,
    footer,
    flags,
    listHash(components),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEmbedResponse &&
        type == other.type &&
        url == other.url &&
        title == other.title &&
        description == other.description &&
        color == other.color &&
        timestamp == other.timestamp &&
        listsEqual(fields, other.fields) &&
        author == other.author &&
        provider == other.provider &&
        image == other.image &&
        thumbnail == other.thumbnail &&
        video == other.video &&
        footer == other.footer &&
        flags == other.flags &&
        listsEqual(components, other.components);
  }
}
