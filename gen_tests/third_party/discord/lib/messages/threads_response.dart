import 'package:discord/messages/message_response.dart';
import 'package:discord/messages/thread_member_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ThreadsResponse {
  const ThreadsResponse({
    required this.threads,
    required this.members,
    required this.hasMore,
    this.firstMessages,
  });

  /// Converts a `Map<String, dynamic>` to a [ThreadsResponse].
  factory ThreadsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThreadsResponse',
      json,
      () => ThreadsResponse(
        threads: (json['threads'] as List)
            .map<ThreadResponse>(
              (e) => ThreadResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        members: (json['members'] as List)
            .map<ThreadMemberResponse>(
              (e) => ThreadMemberResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        hasMore: json['has_more'] as bool,
        firstMessages: (json['first_messages'] as List?)
            ?.map<MessageResponse>(
              (e) => MessageResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThreadsResponse.fromJson(json);
  }

  final List<ThreadResponse> threads;
  final List<ThreadMemberResponse> members;
  final bool hasMore;
  final List<MessageResponse>? firstMessages;

  /// Converts a [ThreadsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'threads': threads.map((e) => e.toJson()).toList(),
      'members': members.map((e) => e.toJson()).toList(),
      'has_more': hasMore,
      'first_messages': ?firstMessages?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(threads),
    listHash(members),
    hasMore,
    listHash(firstMessages),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadsResponse &&
        listsEqual(threads, other.threads) &&
        listsEqual(members, other.members) &&
        hasMore == other.hasMore &&
        listsEqual(firstMessages, other.firstMessages);
  }
}
