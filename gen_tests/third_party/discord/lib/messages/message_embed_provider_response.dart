import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEmbedProviderResponse {
  const MessageEmbedProviderResponse({required this.name, this.url});

  /// Converts a `Map<String, dynamic>` to a [MessageEmbedProviderResponse].
  factory MessageEmbedProviderResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEmbedProviderResponse',
      json,
      () => MessageEmbedProviderResponse(
        name: json['name'] as String,
        url: maybeParseUri(json['url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEmbedProviderResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageEmbedProviderResponse.fromJson(json);
  }

  final String name;
  final Uri? url;

  /// Converts a [MessageEmbedProviderResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([name, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEmbedProviderResponse &&
        name == other.name &&
        url == other.url;
  }
}
