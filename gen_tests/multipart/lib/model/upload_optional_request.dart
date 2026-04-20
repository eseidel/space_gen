import 'dart:typed_data';
import 'package:multipart/model_helpers.dart';

class UploadOptionalRequest {
  UploadOptionalRequest({
    required this.file,
    this.note,
  });

  /// Converts a `Map<String, dynamic>` to a [UploadOptionalRequest].
  factory UploadOptionalRequest.fromJson(dynamic jsonArg) {
    // `jsonArg` appears in the message so the unused-parameter lint
    // stays quiet on types that can't round-trip through JSON.
    throw UnsupportedError(
      'UploadOptionalRequest: binary field present; '
      'cannot decode from JSON. Input: $jsonArg',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadOptionalRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadOptionalRequest.fromJson(json);
  }

  Uint8List file;
  String? note;

  /// Converts a [UploadOptionalRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadOptionalRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(file),
    note,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadOptionalRequest &&
        listsEqual(file, other.file) &&
        note == other.note;
  }
}
