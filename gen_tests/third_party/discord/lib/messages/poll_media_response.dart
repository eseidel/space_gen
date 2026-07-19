import 'package:discord/messages/message_reaction_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollMediaResponse {
  const PollMediaResponse({this.text, this.emoji});

  /// Converts a `Map<String, dynamic>` to a [PollMediaResponse].
  factory PollMediaResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollMediaResponse',
      json,
      () => PollMediaResponse(
        text: json['text'] as String?,
        emoji: MessageReactionEmojiResponse.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollMediaResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollMediaResponse.fromJson(json);
  }

  final String? text;
  final MessageReactionEmojiResponse? emoji;

  /// Converts a [PollMediaResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (text != null) 'text': text,
      if (emoji != null) 'emoji': emoji?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([text, emoji]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollMediaResponse &&
        text == other.text &&
        emoji == other.emoji;
  }
}
