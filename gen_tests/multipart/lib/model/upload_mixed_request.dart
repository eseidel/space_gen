import 'dart:typed_data';
import 'package:multipart/model_helpers.dart';

class UploadMixedRequest {
  UploadMixedRequest({
    required this.file,
    required this.name,
    this.description,
    this.size,
  });

  /// Converts a `Map<String, dynamic>` to a [UploadMixedRequest].
  factory UploadMixedRequest.fromJson(dynamic jsonArg) {
    // `jsonArg` appears in the message so the unused-parameter lint
    // stays quiet on types that can't round-trip through JSON.
    throw UnsupportedError(
      'UploadMixedRequest: binary field present; '
      'cannot decode from JSON. Input: $jsonArg',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadMixedRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UploadMixedRequest.fromJson(json);
  }

  Uint8List file;
  String name;
  String? description;
  int? size;

  /// Converts a [UploadMixedRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    throw UnsupportedError(
      'Cannot encode UploadMixedRequest as JSON (binary field present).',
    );
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(file),
    name,
    description,
    size,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadMixedRequest &&
        listsEqual(file, other.file) &&
        name == other.name &&
        description == other.description &&
        size == other.size;
  }
}
