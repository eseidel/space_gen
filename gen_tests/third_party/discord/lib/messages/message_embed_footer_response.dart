import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEmbedFooterResponse {
  const MessageEmbedFooterResponse({
    required this.text,
    this.iconUrl,
    this.proxyIconUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageEmbedFooterResponse].
  factory MessageEmbedFooterResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEmbedFooterResponse',
      json,
      () => MessageEmbedFooterResponse(
        text: json['text'] as String,
        iconUrl: json['icon_url'] as String?,
        proxyIconUrl: maybeParseUri(json['proxy_icon_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEmbedFooterResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageEmbedFooterResponse.fromJson(json);
  }

  final String text;
  final String? iconUrl;
  final Uri? proxyIconUrl;

  /// Converts a [MessageEmbedFooterResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (proxyIconUrl != null) 'proxy_icon_url': proxyIconUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([text, iconUrl, proxyIconUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEmbedFooterResponse &&
        text == other.text &&
        iconUrl == other.iconUrl &&
        proxyIconUrl == other.proxyIconUrl;
  }
}
