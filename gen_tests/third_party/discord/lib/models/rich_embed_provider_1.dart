import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedProvider1 {
  const RichEmbedProvider1({this.name, this.url});

  /// Converts a `Map<String, dynamic>` to a [RichEmbedProvider1].
  factory RichEmbedProvider1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedProvider1',
      json,
      () => RichEmbedProvider1(
        name: json['name'] as String?,
        url: maybeParseUri(json['url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedProvider1? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedProvider1.fromJson(json);
  }

  final String? name;
  final Uri? url;

  /// Converts a [RichEmbedProvider1] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([name, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedProvider1 &&
        name == other.name &&
        url == other.url;
  }
}
