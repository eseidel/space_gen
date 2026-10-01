// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedField {
  RichEmbedField({required this.name, required this.value, this.inline}) {
    name.validate(maxLength: 256);
    value.validate(maxLength: 1024);
  }

  /// Converts a `Map<String, dynamic>` to a [RichEmbedField].
  factory RichEmbedField.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedField',
      json,
      () => RichEmbedField(
        name: json['name'] as String,
        value: json['value'] as String,
        inline: json['inline'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedField? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedField.fromJson(json);
  }

  final String name;
  final String value;
  final bool? inline;

  /// Converts a [RichEmbedField] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value, 'inline': inline};
  }

  @override
  int get hashCode => Object.hashAll([name, value, inline]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedField &&
        name == other.name &&
        value == other.value &&
        inline == other.inline;
  }
}
