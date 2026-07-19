import 'package:discord/messages/message_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PinnedMessageResponse {
  const PinnedMessageResponse({required this.pinnedAt, required this.message});

  /// Converts a `Map<String, dynamic>` to a [PinnedMessageResponse].
  factory PinnedMessageResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PinnedMessageResponse',
      json,
      () => PinnedMessageResponse(
        pinnedAt: DateTime.parse(json['pinned_at'] as String),
        message: MessageResponse.fromJson(
          json['message'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PinnedMessageResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PinnedMessageResponse.fromJson(json);
  }

  final DateTime pinnedAt;
  final MessageResponse message;

  /// Converts a [PinnedMessageResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'pinned_at': pinnedAt.toIso8601String(),
      'message': message.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([pinnedAt, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PinnedMessageResponse &&
        pinnedAt == other.pinnedAt &&
        message == other.message;
  }
}
