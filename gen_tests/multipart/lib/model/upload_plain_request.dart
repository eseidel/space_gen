import 'dart:typed_data';
import 'package:multipart/model_helpers.dart';

class UploadPlainRequest {
  UploadPlainRequest({
    required this.file,
  });

  /// Converts a `Map<String, dynamic>` to a [UploadPlainRequest].
  factory UploadPlainRequest.fromJson(dynamic jsonArg) {
    // `jsonArg` appears in the message so the unused-parameter lint
    // stays quiet on types that can't round-trip through JSON.
    throw UnsupportedError(
      'UploadPlainRequest: binary field present; '
      'cannot decode from JSON. Input: $jsonArg',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadPlainRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadPlainRequest.fromJson(json);
  }

  Uint8List file;

  /// Converts a [UploadPlainRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadPlainRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => listHash(file).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadPlainRequest && listsEqual(file, other.file);
  }
}
