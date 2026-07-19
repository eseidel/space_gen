import 'package:discord/model_helpers.dart';
import 'package:discord/models/poll_emoji.dart';
import 'package:meta/meta.dart';

@immutable
class PollMedia {
  const PollMedia({this.text, this.emoji});

  /// Converts a `Map<String, dynamic>` to a [PollMedia].
  factory PollMedia.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollMedia',
      json,
      () => PollMedia(
        text: json['text'] as String?,
        emoji: PollEmoji.maybeFromJson(json['emoji'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollMedia? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollMedia.fromJson(json);
  }

  final String? text;
  final PollEmoji? emoji;

  /// Converts a [PollMedia] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': text, 'emoji': emoji?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([text, emoji]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollMedia && text == other.text && emoji == other.emoji;
  }
}
