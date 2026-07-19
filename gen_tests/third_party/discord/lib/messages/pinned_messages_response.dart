import 'package:discord/messages/pinned_message_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PinnedMessagesResponse {
  const PinnedMessagesResponse({required this.items, required this.hasMore});

  /// Converts a `Map<String, dynamic>` to a [PinnedMessagesResponse].
  factory PinnedMessagesResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PinnedMessagesResponse',
      json,
      () => PinnedMessagesResponse(
        items: (json['items'] as List)
            .map<PinnedMessageResponse>(
              (e) => PinnedMessageResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        hasMore: json['has_more'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PinnedMessagesResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PinnedMessagesResponse.fromJson(json);
  }

  final List<PinnedMessageResponse> items;
  final bool hasMore;

  /// Converts a [PinnedMessagesResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'has_more': hasMore,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(items), hasMore]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PinnedMessagesResponse &&
        listsEqual(items, other.items) &&
        hasMore == other.hasMore;
  }
}
