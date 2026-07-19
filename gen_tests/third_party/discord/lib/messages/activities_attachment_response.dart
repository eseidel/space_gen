import 'package:discord/messages/attachment_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivitiesAttachmentResponse {
  const ActivitiesAttachmentResponse({required this.attachment});

  /// Converts a `Map<String, dynamic>` to an [ActivitiesAttachmentResponse].
  factory ActivitiesAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActivitiesAttachmentResponse',
      json,
      () => ActivitiesAttachmentResponse(
        attachment: AttachmentResponse.fromJson(
          json['attachment'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivitiesAttachmentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivitiesAttachmentResponse.fromJson(json);
  }

  final AttachmentResponse attachment;

  /// Converts an [ActivitiesAttachmentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'attachment': attachment.toJson()};
  }

  @override
  int get hashCode => attachment.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivitiesAttachmentResponse &&
        attachment == other.attachment;
  }
}
