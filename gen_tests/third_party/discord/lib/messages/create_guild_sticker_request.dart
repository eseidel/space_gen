// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CreateGuildStickerRequest {
  CreateGuildStickerRequest({
    required this.name,
    required this.tags,
    required this.file,
    this.description,
  }) {
    name.validate(minLength: 2, maxLength: 30);
    tags.validate(minLength: 1, maxLength: 200);
    description?.validate(maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to a [CreateGuildStickerRequest].
  factory CreateGuildStickerRequest.fromJson(Map<String, dynamic> json) {
    throw UnsupportedError(
      'Cannot decode CreateGuildStickerRequest from JSON (binary field present). '
      'Input was: $json',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildStickerRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGuildStickerRequest.fromJson(json);
  }

  final String name;
  final String tags;
  final String? description;
  final Uint8List file;

  /// Converts a [CreateGuildStickerRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode CreateGuildStickerRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => Object.hashAll([name, tags, description, listHash(file)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGuildStickerRequest &&
        name == other.name &&
        tags == other.tags &&
        description == other.description &&
        listsEqual(file, other.file);
  }
}
