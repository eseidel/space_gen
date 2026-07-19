import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MessageReactionCountDetailsResponse {
  const MessageReactionCountDetailsResponse({
    required this.burst,
    required this.normal,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MessageReactionCountDetailsResponse].
  factory MessageReactionCountDetailsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MessageReactionCountDetailsResponse',
      json,
      () => MessageReactionCountDetailsResponse(
        burst: json['burst'] as int,
        normal: json['normal'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageReactionCountDetailsResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageReactionCountDetailsResponse.fromJson(json);
  }

  final int burst;
  final int normal;

  /// Converts a [MessageReactionCountDetailsResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'burst': burst, 'normal': normal};
  }

  @override
  int get hashCode => Object.hashAll([burst, normal]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageReactionCountDetailsResponse &&
        burst == other.burst &&
        normal == other.normal;
  }
}
