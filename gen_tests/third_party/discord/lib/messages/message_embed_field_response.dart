import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageEmbedFieldResponse {
  const MessageEmbedFieldResponse({
    required this.name,
    required this.value,
    required this.inline,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageEmbedFieldResponse].
  factory MessageEmbedFieldResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageEmbedFieldResponse',
      json,
      () => MessageEmbedFieldResponse(
        name: json['name'] as String,
        value: json['value'] as String,
        inline: json['inline'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEmbedFieldResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageEmbedFieldResponse.fromJson(json);
  }

  final String name;
  final String value;
  final bool inline;

  /// Converts a [MessageEmbedFieldResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value, 'inline': inline};
  }

  @override
  int get hashCode => Object.hashAll([name, value, inline]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageEmbedFieldResponse &&
        name == other.name &&
        value == other.value &&
        inline == other.inline;
  }
}
