import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UnfurledMediaResponse {
  const UnfurledMediaResponse({
    required this.id,
    required this.url,
    required this.proxyUrl,
    this.width,
    this.height,
    this.contentType,
    this.attachmentId,
  });

  /// Converts a `Map<String, dynamic>` to a [UnfurledMediaResponse].
  factory UnfurledMediaResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UnfurledMediaResponse',
      json,
      () => UnfurledMediaResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        url: json['url'] as String,
        proxyUrl: json['proxy_url'] as String,
        width: json['width'] as int?,
        height: json['height'] as int?,
        contentType: json['content_type'] as String?,
        attachmentId: SnowflakeType.maybeFromJson(
          json['attachment_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UnfurledMediaResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UnfurledMediaResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String url;
  final String proxyUrl;
  final int? width;
  final int? height;
  final String? contentType;
  final SnowflakeType? attachmentId;

  /// Converts a [UnfurledMediaResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'url': url,
      'proxy_url': proxyUrl,
      'width': width,
      'height': height,
      'content_type': contentType,
      if (attachmentId != null) 'attachment_id': attachmentId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    url,
    proxyUrl,
    width,
    height,
    contentType,
    attachmentId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnfurledMediaResponse &&
        id == other.id &&
        url == other.url &&
        proxyUrl == other.proxyUrl &&
        width == other.width &&
        height == other.height &&
        contentType == other.contentType &&
        attachmentId == other.attachmentId;
  }
}
