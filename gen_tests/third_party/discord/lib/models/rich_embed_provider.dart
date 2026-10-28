import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedProvider {
  RichEmbedProvider({this.name, this.url}) {
    name?.validate(maxLength: 256);
  }

  /// Converts a `Map<String, dynamic>` to a [RichEmbedProvider].
  factory RichEmbedProvider.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedProvider',
      json,
      () => RichEmbedProvider(
        name: json['name'] as String?,
        url: maybeParseUri(json['url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedProvider? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedProvider.fromJson(json);
  }

  final String? name;
  final Uri? url;

  /// Converts a [RichEmbedProvider] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([name, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedProvider && name == other.name && url == other.url;
  }
}
