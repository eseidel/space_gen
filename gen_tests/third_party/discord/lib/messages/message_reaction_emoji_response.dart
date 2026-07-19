import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageReactionEmojiResponse {
  const MessageReactionEmojiResponse({
    required this.id,
    required this.name,
    this.animated,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageReactionEmojiResponse].
  factory MessageReactionEmojiResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageReactionEmojiResponse',
      json,
      () => MessageReactionEmojiResponse(
        id: SnowflakeType.maybeFromJson(checkedKey(json, 'id') as String?),
        name: checkedKey(json, 'name') as String?,
        animated: json['animated'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageReactionEmojiResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageReactionEmojiResponse.fromJson(json);
  }

  final SnowflakeType? id;
  final String? name;
  final bool? animated;

  /// Converts a [MessageReactionEmojiResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id?.toJson(), 'name': name, 'animated': ?animated};
  }

  @override
  int get hashCode => Object.hashAll([id, name, animated]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageReactionEmojiResponse &&
        id == other.id &&
        name == other.name &&
        animated == other.animated;
  }
}
