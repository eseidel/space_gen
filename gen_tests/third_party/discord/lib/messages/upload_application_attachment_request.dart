// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UploadApplicationAttachmentRequest {
  const UploadApplicationAttachmentRequest({required this.file});

  /// Converts a `Map<String, dynamic>` to a
  /// [UploadApplicationAttachmentRequest].
  factory UploadApplicationAttachmentRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    throw UnsupportedError(
      'Cannot decode UploadApplicationAttachmentRequest from JSON (binary field present). '
      'Input was: $json',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadApplicationAttachmentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UploadApplicationAttachmentRequest.fromJson(json);
  }

  final Uint8List file;

  /// Converts a [UploadApplicationAttachmentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadApplicationAttachmentRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => listHash(file).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadApplicationAttachmentRequest &&
        listsEqual(file, other.file);
  }
}
