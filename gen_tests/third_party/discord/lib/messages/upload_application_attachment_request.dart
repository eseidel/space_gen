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
    return parseFromJson(
      'UploadApplicationAttachmentRequest',
      json,
      () => UploadApplicationAttachmentRequest(file: json['file'] as String),
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

  final String file;

  /// Converts a [UploadApplicationAttachmentRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'file': file};
  }

  @override
  int get hashCode => file.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UploadApplicationAttachmentRequest && file == other.file;
  }
}
