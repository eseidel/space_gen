import 'package:discord/api_exception.dart';
import 'package:discord/messages/poll_emoji_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollMediaCreateRequest {
  PollMediaCreateRequest({this.text, this.emoji}) {
    text?.validate(minLength: 1, maxLength: 300);
  }

  /// Converts a `Map<String, dynamic>` to a [PollMediaCreateRequest].
  factory PollMediaCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollMediaCreateRequest',
      json,
      () => PollMediaCreateRequest(
        text: json['text'] as String?,
        emoji: PollEmojiCreateRequest.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollMediaCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollMediaCreateRequest.fromJson(json);
  }

  final String? text;
  final PollEmojiCreateRequest? emoji;

  /// Converts a [PollMediaCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': text, 'emoji': emoji?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([text, emoji]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollMediaCreateRequest &&
        text == other.text &&
        emoji == other.emoji;
  }
}
