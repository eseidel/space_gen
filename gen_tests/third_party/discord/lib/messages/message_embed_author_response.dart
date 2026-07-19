import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEmbedAuthorResponse {
  const MessageEmbedAuthorResponse({
    required this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageEmbedAuthorResponse].
  factory MessageEmbedAuthorResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEmbedAuthorResponse',
      json,
      () => MessageEmbedAuthorResponse(
        name: json['name'] as String,
        url: json['url'] as String?,
        iconUrl: json['icon_url'] as String?,
        proxyIconUrl: maybeParseUri(json['proxy_icon_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEmbedAuthorResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageEmbedAuthorResponse.fromJson(json);
  }

  final String name;
  final String? url;
  final String? iconUrl;
  final Uri? proxyIconUrl;

  /// Converts a [MessageEmbedAuthorResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': ?url,
      'icon_url': ?iconUrl,
      'proxy_icon_url': ?proxyIconUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, url, iconUrl, proxyIconUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEmbedAuthorResponse &&
        name == other.name &&
        url == other.url &&
        iconUrl == other.iconUrl &&
        proxyIconUrl == other.proxyIconUrl;
  }
}
