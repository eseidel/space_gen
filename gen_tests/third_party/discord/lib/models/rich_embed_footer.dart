import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedFooter {
  RichEmbedFooter({this.text, this.iconUrl}) {
    text?.validate(maxLength: 2048);
  }

  /// Converts a `Map<String, dynamic>` to a [RichEmbedFooter].
  factory RichEmbedFooter.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedFooter',
      json,
      () => RichEmbedFooter(
        text: json['text'] as String?,
        iconUrl: maybeParseUri(json['icon_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedFooter? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedFooter.fromJson(json);
  }

  final String? text;
  final Uri? iconUrl;

  /// Converts a [RichEmbedFooter] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': text, 'icon_url': iconUrl?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([text, iconUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedFooter &&
        text == other.text &&
        iconUrl == other.iconUrl;
  }
}
