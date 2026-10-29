import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedAuthor {
  RichEmbedAuthor({this.name, this.url, this.iconUrl}) {
    name?.validate(maxLength: 256);
  }

  /// Converts a `Map<String, dynamic>` to a [RichEmbedAuthor].
  factory RichEmbedAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedAuthor',
      json,
      () => RichEmbedAuthor(
        name: json['name'] as String?,
        url: maybeParseUri(json['url'] as String?),
        iconUrl: maybeParseUri(json['icon_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedAuthor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedAuthor.fromJson(json);
  }

  final String? name;
  final Uri? url;
  final Uri? iconUrl;

  /// Converts a [RichEmbedAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url?.toString(),
      'icon_url': iconUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, url, iconUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedAuthor &&
        name == other.name &&
        url == other.url &&
        iconUrl == other.iconUrl;
  }
}
