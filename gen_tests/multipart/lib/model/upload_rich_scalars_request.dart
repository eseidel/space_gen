import 'dart:typed_data';
import 'package:multipart/model/upload_rich_scalars_request_visibility.dart';
import 'package:multipart/model_helpers.dart';

class UploadRichScalarsRequest {
  UploadRichScalarsRequest({
    required this.file,
    required this.visibility,
    required this.capturedAt,
    this.tag,
  });

  /// Converts a `Map<String, dynamic>` to a [UploadRichScalarsRequest].
  factory UploadRichScalarsRequest.fromJson(dynamic jsonArg) {
    // `jsonArg` appears in the message so the unused-parameter lint
    // stays quiet on types that can't round-trip through JSON.
    throw UnsupportedError(
      'UploadRichScalarsRequest: binary field present; '
      'cannot decode from JSON. Input: $jsonArg',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadRichScalarsRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadRichScalarsRequest.fromJson(json);
  }

  Uint8List file;
  UploadRichScalarsRequestVisibility visibility;
  DateTime capturedAt;
  String? tag;

  /// Converts a [UploadRichScalarsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadRichScalarsRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(file),
    visibility,
    capturedAt,
    tag,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadRichScalarsRequest &&
        listsEqual(file, other.file) &&
        visibility == other.visibility &&
        capturedAt == other.capturedAt &&
        tag == other.tag;
  }
}
