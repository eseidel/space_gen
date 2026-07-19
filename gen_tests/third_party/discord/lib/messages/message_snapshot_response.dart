import 'package:discord/messages/minimal_content_message_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageSnapshotResponse {
  const MessageSnapshotResponse({required this.message});

  /// Converts a `Map<String, dynamic>` to a [MessageSnapshotResponse].
  factory MessageSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageSnapshotResponse',
      json,
      () => MessageSnapshotResponse(
        message: MinimalContentMessageResponse.fromJson(
          json['message'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageSnapshotResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageSnapshotResponse.fromJson(json);
  }

  final MinimalContentMessageResponse message;

  /// Converts a [MessageSnapshotResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message.toJson()};
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageSnapshotResponse && message == other.message;
  }
}
