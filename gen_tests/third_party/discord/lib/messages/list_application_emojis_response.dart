import 'package:discord/messages/emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ListApplicationEmojisResponse {
  const ListApplicationEmojisResponse({required this.items});

  /// Converts a `Map<String, dynamic>` to a [ListApplicationEmojisResponse].
  factory ListApplicationEmojisResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ListApplicationEmojisResponse',
      json,
      () => ListApplicationEmojisResponse(
        items: (json['items'] as List)
            .map<EmojiResponse>(
              (e) => EmojiResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListApplicationEmojisResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListApplicationEmojisResponse.fromJson(json);
  }

  final List<EmojiResponse> items;

  /// Converts a [ListApplicationEmojisResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(items).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ListApplicationEmojisResponse &&
        listsEqual(items, other.items);
  }
}
