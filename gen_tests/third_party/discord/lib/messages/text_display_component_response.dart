// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class TextDisplayComponentResponse {
  const TextDisplayComponentResponse({required this.id, required this.content});

  /// Converts a `Map<String, dynamic>` to a [TextDisplayComponentResponse].
  factory TextDisplayComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TextDisplayComponentResponse',
      json,
      () => TextDisplayComponentResponse(
        id: json['id'] as int,
        content: json['content'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TextDisplayComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TextDisplayComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.textDisplay;
  final int id;
  final String content;

  /// Converts a [TextDisplayComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'id': id, 'content': content};
  }

  @override
  int get hashCode => Object.hashAll([id, content]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextDisplayComponentResponse &&
        id == other.id &&
        content == other.content;
  }
}
