import 'package:discord/messages/message_reaction_count_details_response.dart';
import 'package:discord/messages/message_reaction_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageReactionResponse {
  const MessageReactionResponse({
    required this.emoji,
    required this.count,
    required this.countDetails,
    required this.burstColors,
    required this.meBurst,
    required this.me,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageReactionResponse].
  factory MessageReactionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageReactionResponse',
      json,
      () => MessageReactionResponse(
        emoji: MessageReactionEmojiResponse.fromJson(
          json['emoji'] as Map<String, dynamic>,
        ),
        count: json['count'] as int,
        countDetails: MessageReactionCountDetailsResponse.fromJson(
          json['count_details'] as Map<String, dynamic>,
        ),
        burstColors: (json['burst_colors'] as List).cast<String>(),
        meBurst: json['me_burst'] as bool,
        me: json['me'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageReactionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageReactionResponse.fromJson(json);
  }

  final MessageReactionEmojiResponse emoji;
  final int count;
  final MessageReactionCountDetailsResponse countDetails;
  final List<String> burstColors;
  final bool meBurst;
  final bool me;

  /// Converts a [MessageReactionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'emoji': emoji.toJson(),
      'count': count,
      'count_details': countDetails.toJson(),
      'burst_colors': burstColors,
      'me_burst': meBurst,
      'me': me,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    emoji,
    count,
    countDetails,
    listHash(burstColors),
    meBurst,
    me,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageReactionResponse &&
        emoji == other.emoji &&
        count == other.count &&
        countDetails == other.countDetails &&
        listsEqual(burstColors, other.burstColors) &&
        meBurst == other.meBurst &&
        me == other.me;
  }
}
