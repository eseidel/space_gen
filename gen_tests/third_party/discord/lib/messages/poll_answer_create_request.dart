import 'package:discord/messages/poll_media_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollAnswerCreateRequest {
  const PollAnswerCreateRequest({required this.pollMedia});

  /// Converts a `Map<String, dynamic>` to a [PollAnswerCreateRequest].
  factory PollAnswerCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollAnswerCreateRequest',
      json,
      () => PollAnswerCreateRequest(
        pollMedia: PollMediaCreateRequest.fromJson(
          json['poll_media'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollAnswerCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollAnswerCreateRequest.fromJson(json);
  }

  final PollMediaCreateRequest pollMedia;

  /// Converts a [PollAnswerCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'poll_media': pollMedia.toJson()};
  }

  @override
  int get hashCode => pollMedia.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollAnswerCreateRequest && pollMedia == other.pollMedia;
  }
}
