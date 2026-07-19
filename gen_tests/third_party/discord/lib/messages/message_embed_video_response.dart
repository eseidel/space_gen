import 'package:discord/model_helpers.dart';
import 'package:discord/models/u_int32_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEmbedVideoResponse {
  const MessageEmbedVideoResponse({
    this.url,
    this.proxyUrl,
    this.width,
    this.height,
    this.contentType,
    this.placeholder,
    this.placeholderVersion,
    this.description,
    this.flags,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageEmbedVideoResponse].
  factory MessageEmbedVideoResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEmbedVideoResponse',
      json,
      () => MessageEmbedVideoResponse(
        url: json['url'] as String?,
        proxyUrl: maybeParseUri(json['proxy_url'] as String?),
        width: UInt32Type.maybeFromJson(json['width'] as int?),
        height: UInt32Type.maybeFromJson(json['height'] as int?),
        contentType: json['content_type'] as String?,
        placeholder: json['placeholder'] as String?,
        placeholderVersion: UInt32Type.maybeFromJson(
          json['placeholder_version'] as int?,
        ),
        description: json['description'] as String?,
        flags: UInt32Type.maybeFromJson(json['flags'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEmbedVideoResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageEmbedVideoResponse.fromJson(json);
  }

  final String? url;
  final Uri? proxyUrl;
  final UInt32Type? width;
  final UInt32Type? height;
  final String? contentType;
  final String? placeholder;
  final UInt32Type? placeholderVersion;
  final String? description;
  final UInt32Type? flags;

  /// Converts a [MessageEmbedVideoResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (url != null) 'url': url,
      if (proxyUrl != null) 'proxy_url': proxyUrl?.toString(),
      if (width != null) 'width': width?.toJson(),
      if (height != null) 'height': height?.toJson(),
      if (contentType != null) 'content_type': contentType,
      if (placeholder != null) 'placeholder': placeholder,
      if (placeholderVersion != null)
        'placeholder_version': placeholderVersion?.toJson(),
      if (description != null) 'description': description,
      if (flags != null) 'flags': flags?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    proxyUrl,
    width,
    height,
    contentType,
    placeholder,
    placeholderVersion,
    description,
    flags,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEmbedVideoResponse &&
        url == other.url &&
        proxyUrl == other.proxyUrl &&
        width == other.width &&
        height == other.height &&
        contentType == other.contentType &&
        placeholder == other.placeholder &&
        placeholderVersion == other.placeholderVersion &&
        description == other.description &&
        flags == other.flags;
  }
}
