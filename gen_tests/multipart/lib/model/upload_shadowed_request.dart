import 'dart:typed_data';
import 'package:multipart/model_helpers.dart';

class UploadShadowedRequest {
  UploadShadowedRequest({required this.primary, this.note, this.file});

  /// Converts a `Map<String, dynamic>` to a [UploadShadowedRequest].
  factory UploadShadowedRequest.fromJson(dynamic jsonArg) {
    // `jsonArg` appears in the message so the unused-parameter lint
    // stays quiet on types that can't round-trip through JSON.
    throw UnsupportedError(
      'UploadShadowedRequest: binary field present; '
      'cannot decode from JSON. Input: $jsonArg',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadShadowedRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadShadowedRequest.fromJson(json);
  }

  Uint8List primary;
  String? note;
  Uint8List? file;

  /// Converts a [UploadShadowedRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadShadowedRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => Object.hashAll([listHash(primary), note, listHash(file)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadShadowedRequest &&
        listsEqual(primary, other.primary) &&
        note == other.note &&
        listsEqual(file, other.file);
  }
}
