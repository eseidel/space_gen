import 'package:discord/messages/poll_media_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollAnswerResponse {
  const PollAnswerResponse({required this.answerId, required this.pollMedia});

  /// Converts a `Map<String, dynamic>` to a [PollAnswerResponse].
  factory PollAnswerResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollAnswerResponse',
      json,
      () => PollAnswerResponse(
        answerId: json['answer_id'] as int,
        pollMedia: PollMediaResponse.fromJson(
          json['poll_media'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollAnswerResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollAnswerResponse.fromJson(json);
  }

  final int answerId;
  final PollMediaResponse pollMedia;

  /// Converts a [PollAnswerResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'answer_id': answerId, 'poll_media': pollMedia.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([answerId, pollMedia]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollAnswerResponse &&
        answerId == other.answerId &&
        pollMedia == other.pollMedia;
  }
}
