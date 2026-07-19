import 'package:github/model_helpers.dart';
import 'package:github/models/commit_search_result_item.dart';
import 'package:meta/meta.dart';

@immutable
class SearchCommits200Response {
  const SearchCommits200Response({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  /// Converts a `Map<String, dynamic>` to a [SearchCommits200Response].
  factory SearchCommits200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SearchCommits200Response',
      json,
      () => SearchCommits200Response(
        totalCount: json['total_count'] as int,
        incompleteResults: json['incomplete_results'] as bool,
        items: (json['items'] as List)
            .map<CommitSearchResultItem>(
              (e) => CommitSearchResultItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchCommits200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SearchCommits200Response.fromJson(json);
  }

  final int totalCount;
  final bool incompleteResults;
  final List<CommitSearchResultItem> items;

  /// Converts a [SearchCommits200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalCount, incompleteResults, listHash(items)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchCommits200Response &&
        totalCount == other.totalCount &&
        incompleteResults == other.incompleteResults &&
        listsEqual(items, other.items);
  }
}
