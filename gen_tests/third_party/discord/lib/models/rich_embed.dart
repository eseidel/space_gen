import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/rich_embed_author.dart';
import 'package:discord/models/rich_embed_field.dart';
import 'package:discord/models/rich_embed_footer.dart';
import 'package:discord/models/rich_embed_image.dart';
import 'package:discord/models/rich_embed_provider.dart';
import 'package:discord/models/rich_embed_thumbnail.dart';
import 'package:discord/models/rich_embed_video.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbed {
  RichEmbed({
    this.type,
    this.url,
    this.title,
    this.color,
    this.timestamp,
    this.description,
    this.author,
    this.image,
    this.thumbnail,
    this.footer,
    this.fields,
    this.provider,
    this.video,
  }) {
    type?.validate(maxLength: 152133);
    title?.validate(maxLength: 256);
    color?.validate(min: 0, max: 16777215);
    description?.validate(maxLength: 4096);
    fields?.validate(maxItems: 25);
  }

  /// Converts a `Map<String, dynamic>` to a [RichEmbed].
  factory RichEmbed.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbed',
      json,
      () => RichEmbed(
        type: json['type'] as String?,
        url: maybeParseUri(json['url'] as String?),
        title: json['title'] as String?,
        color: json['color'] as int?,
        timestamp: maybeParseDateTime(json['timestamp'] as String?),
        description: json['description'] as String?,
        author: RichEmbedAuthor.maybeFromJson(
          json['author'] as Map<String, dynamic>?,
        ),
        image: RichEmbedImage.maybeFromJson(
          json['image'] as Map<String, dynamic>?,
        ),
        thumbnail: RichEmbedThumbnail.maybeFromJson(
          json['thumbnail'] as Map<String, dynamic>?,
        ),
        footer: RichEmbedFooter.maybeFromJson(
          json['footer'] as Map<String, dynamic>?,
        ),
        fields: (json['fields'] as List?)
            ?.map<RichEmbedField>(
              (e) => RichEmbedField.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        provider: RichEmbedProvider.maybeFromJson(
          json['provider'] as Map<String, dynamic>?,
        ),
        video: RichEmbedVideo.maybeFromJson(
          json['video'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbed? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbed.fromJson(json);
  }

  final String? type;
  final Uri? url;
  final String? title;
  final int? color;
  final DateTime? timestamp;
  final String? description;
  final RichEmbedAuthor? author;
  final RichEmbedImage? image;
  final RichEmbedThumbnail? thumbnail;
  final RichEmbedFooter? footer;
  final List<RichEmbedField>? fields;
  final RichEmbedProvider? provider;
  final RichEmbedVideo? video;

  /// Converts a [RichEmbed] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url?.toString(),
      'title': title,
      'color': color,
      'timestamp': timestamp?.toUtc().toIso8601String(),
      'description': description,
      'author': author?.toJson(),
      'image': image?.toJson(),
      'thumbnail': thumbnail?.toJson(),
      'footer': footer?.toJson(),
      'fields': fields?.map((e) => e.toJson()).toList(),
      'provider': provider?.toJson(),
      'video': video?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    url,
    title,
    color,
    timestamp,
    description,
    author,
    image,
    thumbnail,
    footer,
    listHash(fields),
    provider,
    video,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbed &&
        type == other.type &&
        url == other.url &&
        title == other.title &&
        color == other.color &&
        timestamp == other.timestamp &&
        description == other.description &&
        author == other.author &&
        image == other.image &&
        thumbnail == other.thumbnail &&
        footer == other.footer &&
        listsEqual(fields, other.fields) &&
        provider == other.provider &&
        video == other.video;
  }
}
