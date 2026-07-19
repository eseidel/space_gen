import 'package:discord/messages/search_message_response.dart';
import 'package:discord/messages/thread_member_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildSearchResponse {
  const GuildSearchResponse({
    required this.messages,
    required this.doingDeepHistoricalIndex,
    required this.totalResults,
    this.threads,
    this.members,
    this.documentsIndexed,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildSearchResponse].
  factory GuildSearchResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildSearchResponse',
      json,
      () => GuildSearchResponse(
        messages: (json['messages'] as List)
            .map<List<SearchMessageResponse>>(
              (e) => (e as List)
                  .map<SearchMessageResponse>(
                    (e) => SearchMessageResponse.fromJson(
                      e as Map<String, dynamic>,
                    ),
                  )
                  .toList(),
            )
            .toList(),
        doingDeepHistoricalIndex: json['doing_deep_historical_index'] as bool,
        totalResults: json['total_results'] as int,
        threads: (json['threads'] as List?)
            ?.map<ThreadResponse>(
              (e) => ThreadResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        members: (json['members'] as List?)
            ?.map<ThreadMemberResponse>(
              (e) => ThreadMemberResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        documentsIndexed: json['documents_indexed'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildSearchResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildSearchResponse.fromJson(json);
  }

  final List<List<SearchMessageResponse>> messages;
  final bool doingDeepHistoricalIndex;
  final int totalResults;
  final List<ThreadResponse>? threads;
  final List<ThreadMemberResponse>? members;
  final int? documentsIndexed;

  /// Converts a [GuildSearchResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'messages': messages
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'doing_deep_historical_index': doingDeepHistoricalIndex,
      'total_results': totalResults,
      'threads': threads?.map((e) => e.toJson()).toList(),
      'members': members?.map((e) => e.toJson()).toList(),
      'documents_indexed': documentsIndexed,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(messages),
    doingDeepHistoricalIndex,
    totalResults,
    listHash(threads),
    listHash(members),
    documentsIndexed,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildSearchResponse &&
        listsEqual(messages, other.messages) &&
        doingDeepHistoricalIndex == other.doingDeepHistoricalIndex &&
        totalResults == other.totalResults &&
        listsEqual(threads, other.threads) &&
        listsEqual(members, other.members) &&
        documentsIndexed == other.documentsIndexed;
  }
}
