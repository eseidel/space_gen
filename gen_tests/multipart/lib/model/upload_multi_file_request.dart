// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';
import 'package:multipart/model_helpers.dart';

class UploadMultiFileRequest {
  UploadMultiFileRequest({required this.primary, this.thumbnail});

  /// Converts a `Map<String, dynamic>` to a [UploadMultiFileRequest].
  factory UploadMultiFileRequest.fromJson(dynamic jsonArg) {
    // `jsonArg` appears in the message so the unused-parameter lint
    // stays quiet on types that can't round-trip through JSON.
    throw UnsupportedError(
      'UploadMultiFileRequest: binary field present; '
      'cannot decode from JSON. Input: $jsonArg',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadMultiFileRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadMultiFileRequest.fromJson(json);
  }

  Uint8List primary;
  Uint8List? thumbnail;

  /// Converts a [UploadMultiFileRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadMultiFileRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => Object.hashAll([listHash(primary), listHash(thumbnail)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadMultiFileRequest &&
        listsEqual(primary, other.primary) &&
        listsEqual(thumbnail, other.thumbnail);
  }
}
