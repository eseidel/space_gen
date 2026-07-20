import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WebhookSlackEmbedField {
  WebhookSlackEmbedField({this.name, this.value, this.inline}) {
    name?.validate(maxLength: 152133);
    value?.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [WebhookSlackEmbedField].
  factory WebhookSlackEmbedField.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WebhookSlackEmbedField',
      json,
      () => WebhookSlackEmbedField(
        name: json['name'] as String?,
        value: json['value'] as String?,
        inline: json['inline'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookSlackEmbedField? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WebhookSlackEmbedField.fromJson(json);
  }

  final String? name;
  final String? value;
  final bool? inline;

  /// Converts a [WebhookSlackEmbedField] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value, 'inline': inline};
  }

  @override
  int get hashCode => Object.hashAll([name, value, inline]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WebhookSlackEmbedField &&
        name == other.name &&
        value == other.value &&
        inline == other.inline;
  }
}
