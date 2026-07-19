import 'dart:convert';
import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CreateApplicationEmojiRequest {
  const CreateApplicationEmojiRequest({
    required this.name,
    required this.image,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateApplicationEmojiRequest].
  factory CreateApplicationEmojiRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateApplicationEmojiRequest',
      json,
      () => CreateApplicationEmojiRequest(
        name: json['name'] as String,
        image: base64.decode(json['image'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateApplicationEmojiRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateApplicationEmojiRequest.fromJson(json);
  }

  final String name;
  final Uint8List image;

  /// Converts a [CreateApplicationEmojiRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'image': base64.encode(image)};
  }

  @override
  int get hashCode => Object.hashAll([name, listHash(image)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateApplicationEmojiRequest &&
        name == other.name &&
        listsEqual(image, other.image);
  }
}
