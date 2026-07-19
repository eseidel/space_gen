import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/unfurled_media_request_with_attachment_reference_required.dart';
import 'package:meta/meta.dart';

@immutable
class FileComponentForMessageRequest {
  const FileComponentForMessageRequest({
    required this.file,
    this.id,
    this.spoiler,
  });

  /// Converts a `Map<String, dynamic>` to a [FileComponentForMessageRequest].
  factory FileComponentForMessageRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileComponentForMessageRequest',
      json,
      () => FileComponentForMessageRequest(
        id: json['id'] as int?,
        spoiler: json['spoiler'] as bool?,
        file: UnfurledMediaRequestWithAttachmentReferenceRequired.fromJson(
          json['file'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FileComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.file;
  final int? id;
  final bool? spoiler;
  final UnfurledMediaRequestWithAttachmentReferenceRequired file;

  /// Converts a [FileComponentForMessageRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'spoiler': spoiler,
      'file': file.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, spoiler, file]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileComponentForMessageRequest &&
        id == other.id &&
        spoiler == other.spoiler &&
        file == other.file;
  }
}
