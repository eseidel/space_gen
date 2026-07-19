import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedFooter1 {
  const RichEmbedFooter1({this.text, this.iconUrl});

  /// Converts a `Map<String, dynamic>` to a [RichEmbedFooter1].
  factory RichEmbedFooter1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedFooter1',
      json,
      () => RichEmbedFooter1(
        text: json['text'] as String?,
        iconUrl: maybeParseUri(json['icon_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedFooter1? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedFooter1.fromJson(json);
  }

  final String? text;
  final Uri? iconUrl;

  /// Converts a [RichEmbedFooter1] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': text, 'icon_url': iconUrl?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([text, iconUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedFooter1 &&
        text == other.text &&
        iconUrl == other.iconUrl;
  }
}
